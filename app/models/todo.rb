class Todo < ApplicationRecord
  belongs_to :project, optional: true
  validates :text,
            presence: true,
            length: { minimum: 4, maximum: 30 }
  validates :isCompleted, inclusion: { in: [true, false], message: "this value must be boolean" }
end
