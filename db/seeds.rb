# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  Part.create(part_number: Faker::Number.number(5), name: Faker::Pokemon.move, max_quantity: 50)
  Warehouse.create(name: Faker::Address.city)
end

3.times do
  part = Part.find 1
  warehouse = Warehouse.find 1
  warehouse.parts << part
end
