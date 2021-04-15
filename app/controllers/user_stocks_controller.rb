class UserStocksController < ApplicationController

  def create
    stock = Stock.check_stock(params[:ticker])
    if stock.blank?
      stock = Stock.new_lookup(params[:ticker])
      stock.save
    end
    @user_stock = UserStock.find_by(user: current_user, stock: stock)
    if @user_stock.blank?
      @user_stock = UserStock.create(user: current_user, stock: stock)
      flash[:notice] = "Stock #{stock.ticker}, #{stock.name} added successfully to your portfolio."
    else
      flash[:alert] = "Stock #{stock.ticker}, #{stock.name} already in your portfolio."
    end
    redirect_to my_portfolio_path
  end

  def destroy
    stock = Stock.find(params[:id])
    #user_stock = UserStock.where(user_id: current_user.id, stock_id: stock.id).first
    #user_stock.destroy
    current_user.stocks.delete(stock)
    flash[:notice] = "Stock #{stock.ticker}, #{stock.name} sucessfully removed from your portfolio."
    redirect_to my_portfolio_path

  end

end
