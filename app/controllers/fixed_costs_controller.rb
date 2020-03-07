class FixedCostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @fixedCost = current_user.fixed_costs.all
     # 総固定費
    gon.money_sum = current_user.fixed_costs.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 月毎の固定費 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.fixed_costs.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end
  end

  def show
    @fixedCost = current_user.fixed_costs.find(params[:id])
  end

  def new
    @fixedCost = FixedCost.new
    # @fixedCost = FixedCostCollection.new
  end

  def edit
    @fixedCost = current_user.fixed_costs.find(params[:id])
  end

  def create
    # @fixedCost = FixedCostCollection.new(fixed_costs_params)
    @fixedCost = FixedCost.new(fixed_cost_params)
    @fixedCost.user_id = current_user.id
    if @fixedCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @fixedCost = current_user.fixed_costs.find(params[:id])
    @fixedCost.assign_attributes(fixed_cost_params)
    if @fixedCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @fixedCost = current_user.fixed_costs.find(params[:id])
    @fixedCost.destroy
    redirect_to :fixed_costs
  end

  def report
    @fixedCost = current_user.fixed_costs.all
     # 総固定費
    gon.money_sum = current_user.fixed_costs.sum(:money)

    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 年毎の固定費 単位1万円
    this_year = t.year
    my_year = []
    year = []
    3.times do |y|
      my_year.push(current_user.fixed_costs.where(created_at: ("#{the_beginning.ago(y.years)}").in_time_zone.all_year).sum(:money) / 10000)
      year.push("#{this_year-y}")
    end
    gon.money_year = my_year.reverse!
    gon.recently_year = year.reverse!

    # 月毎の固定費 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.fixed_costs.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(current_user.fixed_costs.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
    end
    gon.money_week = my_week.reverse!
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:name, :content, :money)
  end

  def fixed_costs_params
    params.require(:fixed_cost)
  end
end