class Task < ApplicationRecord
  has_many :todos

  enum :status, { low: 0, medium: 1, high: 2 }, default: :low
end
