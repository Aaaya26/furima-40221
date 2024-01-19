class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :item_name,        null: false
      t.text       :item_data,        null: false
      t.integer    :item_category_id, null: false
      t.integer    :item_status_id,   null: false
      t.integer    :charge_id,        null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :ship_date_id,     null: false
      t.integer    :price,            null: false
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
