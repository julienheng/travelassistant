class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat, depedent: :destroy
end
