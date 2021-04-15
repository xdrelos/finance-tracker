class UserStocksController < ApplicationController

  def create
    if !Stock.find_by(ticker: params[:ticker])
      stock = Stock.new_lookup(params[:ticker])
      
    else
      stock = Stock.find_by(ticker: params[:ticker]
    end
    @user_stock = UserStock.create(user: current_user, stock: stock)
  end

end
