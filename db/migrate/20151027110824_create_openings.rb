class CreateOpenings < ActiveRecord::Migration
  def change
    create_table :openings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.references :merchant, index: true
      t.integer :status

      t.timestamps
    end
  end
end
