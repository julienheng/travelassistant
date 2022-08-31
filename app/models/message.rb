class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat, dependent: :destroy
end
