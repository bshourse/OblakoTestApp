class Project < ApplicationRecord
  has_many :todos
  validates :title,
            presence: true,
            uniqueness: true,
            length: { minimum: 4, maximum: 15 }
end