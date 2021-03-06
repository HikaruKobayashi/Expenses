class VariableCostsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @variableCost = current_user.variable_costs.all
    # 総変動費
    gon.money_sum = current_user.variable_costs.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(current_user.variable_costs.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
    end
    gon.money_week = my_week.reverse!
  end

  def show
    @variableCost = current_user.variable_costs.find(params[:id])
  end

  def new
    @variableCost = VariableCost.new
  end

  def edit
    @variableCost = current_user.variable_costs.find(params[:id])
  end

  def create
    @variableCost = VariableCost.new(variable_cost_params)
    @variableCost.user_id = current_user.id
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @variableCost = current_user.variable_costs.find(params[:id])
    @variableCost.assign_attributes(variable_cost_params)
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @variableCost = current_user.variable_costs.find(params[:id])
    @variableCost.destroy
    redirect_to :variable_costs
  end

  def report
    @variableCost = current_user.variable_costs.all
    # 総変動費
    gon.money_sum = current_user.variable_costs.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 年毎の変動費 単位1万円
    this_year = t.year
    my_year = []
    year = []
    3.times do |y|
      my_year.push(current_user.variable_costs.where(created_at: ("#{the_beginning.ago(y.years)}").in_time_zone.all_year).sum(:money) / 10000)
      year.push("#{this_year-y}")
    end
    gon.money_year = my_year.reverse!
    gon.recently_year = year.reverse!

    # 月毎の変動費 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.variable_costs.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(current_user.variable_costs.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
    end
    gon.money_week = my_week.reverse!
  end

  private

  def variable_cost_params
    params.require(:variable_cost).permit(:name, :content, :money)
  end
  # 一括専用
  def variable_costs_params
    params.require(:variable_cost)
  end
end
