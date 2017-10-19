require 'rails_helper'

RSpec.describe Part, type: :model do
  let!(:part_example) { Part.new(part_number: 12345, name: 'thruster', max_quantity: 10) }

  it 'is valid with a part_number, name, max_quantity' do
    expect(part_example).to be_valid
  end

  describe "it is invalid when it does not have" do
    it "a part_number" do
      part_example.part_number = nil
      expect(part_example).to_not be_valid
    end

    it "a name" do
      part_example.name = nil
      expect(part_example).to_not be_valid
    end

    it "max_quantity" do
      part_example.max_quantity = nil
      expect(part_example).to_not be_valid
    end
  end

  describe "associations" do
    let!(:warehouse) { Warehouse.new(name: "timbucktoo") }

    it "has many warehouses" do
      part_example.warehouses << warehouse
      expect(part_example.warehouses).to include warehouse
    end
  end

  describe '.overall_total' do
    it "returns total count of parts across warehouses" do
      warehouse1 = Warehouse.create!(name: "timbucktoo")
      warehouse2 = Warehouse.create!(name: "kalamazoo")
      warehouse3 = Warehouse.create!(name: "maryloo")
      part = Part.create(part_number: 12345, name: 'thruster', max_quantity: 10)
      stored_warehouses = [warehouse1, warehouse2, warehouse3]
      part.warehouses << stored_warehouses
      expect(Part.overall_total(part)).to eq(stored_warehouses.length)
    end
  end
end
