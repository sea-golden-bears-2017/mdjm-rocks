class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.integer :employee_num, null: false, unique: true
      t.string :password_digest, null: false
      t.string :role, null: false

      t.timestamps
    end
  end
end
