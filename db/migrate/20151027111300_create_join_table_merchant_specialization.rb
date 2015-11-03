class CreateJoinTableMerchantSpecialization < ActiveRecord::Migration
  def change
    create_join_table :merchants, :specializations do |t|
      # t.index [:merchant_id, :specialization_id]
      # t.index [:specialization_id, :merchant_id]
    end
  end
end
