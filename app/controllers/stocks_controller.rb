class StocksController < ApplicationController

  def search
    if params[:stock].present?
      
      @stock = Stock.new_lookup(params[:stock])
      
      if @stock
        respond_to do |format|
          format.js {render partial: 'users/search_result'}
        end
      else
        flash[:alert] = "Please enter a valid ticker."
        redirect_to my_portfolio_path
      end
      
    else
      flash[:alert] = "Please enter a ticker to search."
      redirect_to my_portfolio_path
    end
  end

end
