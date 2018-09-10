class Adjustment < ApplicationRecord
  validates :value, presence: true
  validates :name, presence: true, length: {maximum: 20}
  validates :kind, presence: true, inclusion: {in: %w(income expense)}
end
