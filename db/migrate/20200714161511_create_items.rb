class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :brand
      t.decimal :price
      t.string :link
      

      t.timestamps null: false
    end
  end
end
