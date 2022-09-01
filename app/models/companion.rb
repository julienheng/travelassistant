class Companion < ApplicationRecord
  belongs_to :trip
  validates :name, :age, :category, presence: true
end
