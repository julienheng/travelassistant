class Trip < ApplicationRecord
  belongs_to :user
  has_many :companions
  validates :start_date, :end_date, :latitude, :longitude, presence: true
  validates :location, :budget, :total_cost, :currency, presence: true
  has_one_attached :photo
end
