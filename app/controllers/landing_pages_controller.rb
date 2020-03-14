class LandingPagesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @landing_page = LandingPage.all
    @income = current_user.incomes.all
    @variable_cost = current_user.variable_costs.all
    @fixed_cost = current_user.fixed_costs.all
    @deposit = current_user.deposits.all

    # 残高
    balance = current_user.incomes.sum(:money) - (current_user.variable_costs.sum(:money) + current_user.fixed_costs.sum(:money))
    gon.balances = "残高#{balance}円"

    # 集計値
    gon.income_sum = current_user.incomes.sum(:money) / 10000
    gon.save_sum = current_user.deposits.sum(:money) / 10000
    gon.variable_cost_sum = current_user.variable_costs.sum(:money) / 10000
    gon.fixed_cost_sum = current_user.fixed_costs.sum(:money) / 10000

    # 目標貯金額の達成理率を計算
    gon.goal_value_sum = LandingPage.sum(:goal) / 10000   
    goal_value = current_user.deposits.sum(:money).to_f / LandingPage.sum(:goal).to_f * 100
    gon.goal = "#{goal_value.floor(1).to_f}%"
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