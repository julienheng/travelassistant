class Trip < ApplicationRecord
  belongs_to :user

  has_many :companions, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  validates :start_date, :end_date, presence: true
  validates :location, :budget, presence: true
end
