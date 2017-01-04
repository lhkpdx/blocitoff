class UsersController < ApplicationController
  # before_filter :authenticate_admin!, :except => [:show]
  before_action :authenticate_user!

  def index
  end

  def show
    @user = current_user
    @items = Item.where(user_id: @user.id)
    @item = Item.new
  end

end
