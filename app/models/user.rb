class User < ApplicationRecord
  validates :name, :employee_num, :password, :role, presence: true
  # validates :password_digest, presence: true, on: :create, unless: 'password.nil? || password.empty?'
  validates :employee_num, uniqueness: true
  belongs_to :warehouse
  has_secure_password
end
