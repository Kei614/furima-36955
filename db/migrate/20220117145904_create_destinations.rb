class CreateDestinations < ActiveRecord::Migration[6.0]
  def change
    create_table :destinations do |t|
      t.string      :zip_code,         null: false
      t.integer     :prefecture_id,    null: false
      t.string      :city,             null: false
      t.string      :address,          null: false
      t.string      :building
      t.string      :telephone_number, null: false
      t.references  :purchase_record,  null: false
      t.timestamps 
    end
  end
end
