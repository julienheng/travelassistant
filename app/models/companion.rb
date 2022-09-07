class Companion < ApplicationRecord
  belongs_to :trip

  validates :name, :age, uniqueness: true, presence: true
  has_one_attached :photo
end
