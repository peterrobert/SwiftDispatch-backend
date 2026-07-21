class User < ApplicationRecord
  belongs_to :tenant

  has_secure_password

  enum :role, { driver: 0, dispatcher: 1, owner: 2, admin: 3 }, default: :driver

  validates :full_name, presence: true
  validates :email, presence: true, uniqueness: { scope: :tenant_id }
end
