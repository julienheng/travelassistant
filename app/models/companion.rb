class Companion < ApplicationRecord
  belongs_to :trip
  validates :name, :age, :type, presence: true
end
