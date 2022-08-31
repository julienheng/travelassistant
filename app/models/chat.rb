class Chat < ApplicationRecord
  has_many :messages
  validates :name, :location, presence: true
end
