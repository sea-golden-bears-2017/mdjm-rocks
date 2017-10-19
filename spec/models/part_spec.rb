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
end
