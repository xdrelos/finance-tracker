class UsersController < ApplicationController
  def my_portfolio
    @tracked_stocks = current_user.stocks
  end

  def show
    @user = User.find(params[:id])
  end
end
