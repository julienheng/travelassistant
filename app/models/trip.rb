class Trip < ApplicationRecord
  belongs_to :user
  has_many :companions, dependent: :destroy
  has_many :flights, dependent: :destroy
  has_many :attractions, dependent: :destroy
  has_many :restaurants, dependent: :destroy
  has_many :accommodations, dependent: :destroy

  validates :start_date, :end_date, presence: true
  validates :origin, :destination, :budget, presence: true

  has_one_attached :photo
  accepts_nested_attributes_for :companions

  def activites
  end

  # @trip.activites => [*Attractions, *Restaurants]
end
