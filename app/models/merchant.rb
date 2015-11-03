require 'elasticsearch/model'

class Merchant < ActiveRecord::Base

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_and_belongs_to_many :specializations, after_add:    [ lambda { |a,c| a.__elasticsearch__.index_document } ],
                          after_remove: [ lambda { |a,c| a.__elasticsearch__.index_document } ]
  has_many :openings

  enum status: [:active, :inactive]
  enum gender: [:male, :female, :other]

  scope :available, -> { joins(:openings).where('openings.end_time > ? and openings.status = ?', Time.now, 1) }

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false'  do
      indexes :name, type: :string
      indexes :about, type: :string
      indexes :avg_rating, type: :float
      indexes :price, type: :float
      indexes :suggest, type: 'completion',index_analyzer: 'simple',
          search_analyzer: 'simple',
          payloads: true
    end
  end

  def self.suggest(query)
    Merchant.__elasticsearch__.client.suggest(index: Merchant.index_name, body: {
        suggestions: {
            text: query,
            completion: {
                field: 'suggest',
                size: 20
            }
        }
    })
  end
  def as_indexed_json(options={})
    suggest= {
        suggest: {
            input: [self.name, self.about, self.specializations],
            output: self.name,
            payload: {
                name: self.name,
                about: self.about,
                specializations: self.specializations
            }
        }
    }
    self.as_json(
        only: [:name, :about, :avg_rating, :price, :review_count],
        include: {
            specializations: {only: :name}
        }
    ).merge(suggest)
  end


  def self.search(query, sort_column, sort_direction)
    __elasticsearch__.search(
          query: {
              query_string: {
              query: "*#{query}*"
          }},
          :sort =>
              [{sort_column => { order: sort_direction }}]
    )
  end
end

Merchant.import force: true
