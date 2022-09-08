class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat, dependent: :destroy
  has_one_attached :photo
end
