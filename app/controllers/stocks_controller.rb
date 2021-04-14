class StocksController < ApplicationController

  def search
    if params[:stock].present?
      
      @stock = Stock.new_lookup(params[:stock].upcase)
      
      if @stock
        respond_to do |format|
          format.js {render partial: 'users/search_result'}
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Please enter a valid ticker."
          format.js {render partial: 'users/search_result'}
        end
        #no redirect with ajax
        #redirect_to my_portfolio_path
      end
      
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a ticker to search."
        format.js {render partial: 'users/search_result'}
      end
    end
  end

end
