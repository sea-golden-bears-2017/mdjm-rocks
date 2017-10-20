FactoryGirl.define do
  factory :warehouse do
    name "Seattle"
  end

  factory :part do
    part_number 123456789
    name "cabbage launcher"
    max_quantity 50
  end

  factory :user do
    name "Wilfred"
    employee_num 12345
    password "password"
    role "manager"
    warehouse { create(:warehouse) }
  end
end
