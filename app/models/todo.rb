class Todo < ApplicationRecord
  belongs_to :task, dependent: :destroy
end
