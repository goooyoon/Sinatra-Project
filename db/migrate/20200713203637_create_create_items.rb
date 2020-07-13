class CreateCreateItems < ActiveRecord::Migration
  def change
    create_table :create_items do |t|
      t.string :item_name
      t.string :description

      t.timestamps null: false
    end
  end
end
