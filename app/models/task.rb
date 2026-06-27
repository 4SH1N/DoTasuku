class Task < ApplicationRecord
  has_many :todos, dependent: :destroy
  belongs_to :user
  enum :priority, { low: 0, medium: 1, high: 2 }, default: :low
end
