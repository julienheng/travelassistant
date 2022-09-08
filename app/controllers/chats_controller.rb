class ChatsController < ApplicationController
  def index
    @chats = Chat.all
  end

  def create
  end

  def show
    @chat = Chat.find(params[:id])
    @message = Message.new
    if current_user.role == "admin"
    else
    end
  end
end
