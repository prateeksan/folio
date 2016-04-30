class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end


  private

    def users_portfolio?
      current_user.id == @portfolio.user_id
    end

    def portfolio_params
      params.require(:portfolio).permit()
    end

end