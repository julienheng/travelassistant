class Trip < ApplicationRecord
  belongs_to :user
  has_many :companions, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_many :accommodations, dependent: :destroy
  validates :start_date, :end_date, :latitude, :longitude, presence: true
  validates :location, :budget, :total_cost, :currency, presence: true

  has_one_attached :photo
  accepts_nested_attributes_for :companions
end
