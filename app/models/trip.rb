class Trip < ApplicationRecord
  belongs_to :user
  has_many :companions
  accepts_nested_attributes_for :companions

end
