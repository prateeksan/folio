class PortfoliosController < ApplicationController

  def index
    @portfolios = Portfolio.all
  end

  def show
    @portfolio = Portfolio.find(params[:id])
  end

  def new
    redirect_to '/' unless current_user 
    @portfolio = Portfolio.new
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    if !users_portfolio?
      redirect_to '/'
    else
      render 'edit'
    end
  end

  def create
    @portfolio = Portfolio.new(portfolio_params)

    if @portfolio.save && current_user
      redirect_to @portfolio
    else
      render 'new'
  end

  def update
    @portfolio = Portfolio.find(params[:id])
    if @portfolio.update(portfolio_params)
      redirect_to @portfolio
    else
      render 'edit'
    end
  end

  def destroy
    @portfolio = Portfolio.find(params[:id])
    if !users_portfolio?
      redirect_to '/' 
    else
      @portfolio.destroy
      redirect_to portfolios_path
    end
  end

  private

    def users_portfolio?
      current_user.id == @portfolio.user_id
    end

    def portfolio_params
      params.require(:portfolio).permit()

end