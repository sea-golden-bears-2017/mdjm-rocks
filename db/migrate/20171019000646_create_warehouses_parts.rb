class CreateWarehousesParts < ActiveRecord::Migration[5.1]
  def change
    create_table :warehouses_parts do |t|
      t.belongs_to :part
      t.belongs_to :warehouse
      
      t.timestamps
    end
  end
end
