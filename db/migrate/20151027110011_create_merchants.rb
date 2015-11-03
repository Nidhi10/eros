class CreateMerchants < ActiveRecord::Migration
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.integer :status, default:0
      t.text :about
      t.integer :gender
      t.float :price, default:0.0
      t.integer :review_count, default:0
      t.float :avg_rating, default:0.0

      t.timestamps
    end
  end
end
