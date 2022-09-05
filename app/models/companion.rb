class Companion < ApplicationRecord
  belongs_to :trip

  validates :name, :age, presence: true
  has_one_attached :photo

end
