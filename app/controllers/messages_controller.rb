class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :stash_user_id

  def index
  end

  def show
  end

  private

  def stash_user_id
    cookies.signed[:user_id] = current_user.id
  end
end
