class Part < ApplicationRecord
  validates :part_number, :name, :max_quantity, presence: true
  has_many :warehouses_parts
  has_many :warehouses, through: :warehouses_parts

  def self.overall_total(part)
    WarehousesPart.where(part_id: part.id).count
  end

  def self.warehouse_total(warehouse, part)
    parts = WarehousesPart.where('warehouse_id = ? AND part_id = ?', warehouse.id, part.id)
    parts.count
  end
end
