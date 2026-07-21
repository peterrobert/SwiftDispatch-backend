class Tenant < ApplicationRecord
  enum :status, { active: 0, suspended: 1, trial: 2 }, default: :trial

  validates :name, presence: true
  validates :subdomain, presence: true, uniqueness: true
  validates :company_email, uniqueness: true, allow_nil: true
end
