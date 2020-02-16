class LandingPagesController < ApplicationController
  def index
    @landing_page = LandingPage.all
    @income = Income.all
    @variable_cost = VariableCost.all
    @fixed_cost = FixedCost.all

    # 集計値
    gon.income_sum = Income.sum(:money) / 10000
    gon.variable_cost_sum = VariableCost.sum(:money) / 10000
    gon.fixed_cost_sum = FixedCost.sum(:money) / 10000

    # 目標貯金額の達成理率を計算 TO DO 良い書き方がないものだろいうか...
    gon.goal_value_sum = LandingPage.sum(:goal) / 10000    
    gon.goal_value = Income.sum(:money).to_f / LandingPage.sum(:goal).to_f * 100
    gon.goal = "#{gon.goal_value.floor}%"
  end

  def new
    @landing_page = LandingPage.new
  end

  def show
    @landing_page = LandingPage.find(params[:id])
  end

  def edit
    @landing_page = LandingPage.find(params[:id])
  end

  def create
    @landing_page = LandingPage.create(landing_page_params)
    @landing_page.save!
    redirect_to('/')
  end

  def update
    @landing_page = LandingPage.find(params[:id])
    @landing_page.update(landing_page_params)
    redirect_to('/')
  end

  def destroy
    @landing_page = LandingPage.find_by(id: params[:id])
    @landing_page.destroy
    redirect_to('/')
  end

  def report; end

  private

  def landing_page_params
    params.require(:landing_page).permit(:goal)
  end
end