class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name,                           null: false
      t.text   :item_description,               null: false
      t.references :user,                       foreign_key: true
      t.integer :price,                         null: false
      t.integer :category_id,                    null: false
      t.integer :state_id,                      null: false
      t.integer :delivery_fee_burden_id,        null: false
      t.integer :shipment_source_prefecture_id, null: false
      t.integer :days_to_ship_id,               null: false
      t.timestamps
    end
  end
end
