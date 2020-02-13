class VariableCostsController < ApplicationController
  def index
    @variableCost = VariableCost.order(created_at: :desc)
    # 総変動費
    gon.money_sum = VariableCost.sum(:money)
    # 日毎の総変動費 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_day = VariableCost.group("date(created_at)").sum(:money)
    # 曜日毎？
    gon.money_7 = VariableCost.where(created_at: 6.day.ago.all_day).sum(:money) / 10000
    gon.money_6 = VariableCost.where(created_at: 5.day.ago.all_day).sum(:money) / 10000
    gon.money_5 = VariableCost.where(created_at: 4.day.ago.all_day).sum(:money) / 10000
    gon.money_4 = VariableCost.where(created_at: 3.day.ago.all_day).sum(:money) / 10000
    gon.money_3 = VariableCost.where(created_at: 2.day.ago.all_day).sum(:money) / 10000
    gon.money_2 = VariableCost.where(created_at: 1.day.ago.all_day).sum(:money) / 10000
    gon.money_1 = VariableCost.where(created_at: Time.zone.now.all_day).sum(:money) / 1000
    
    gon.week = ["日付", "日付", "日付", "日付", "日付", "昨日", "今日"]
    # 月ごとの総変動費 
    # gon.money_month_1 = Income.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_2 = Income.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_3 = Income.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_4 = Income.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_5 = Income.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_6 = Income.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_7 = Income.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_8 = Income.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_9 = Income.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_10 = Income.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_11 = Income.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    # gon.money_month_12 = Income.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # # 1月から12月
    # gon.month = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12]
  end

  def show
    @variableCost = VariableCost.find(params[:id])
  end

  def new
    @variableCost = VariableCostCollection.new
  end

  def edit
    @variableCost = VariableCost.find(params[:id])
  end

  def create
    @variableCost = VariableCostCollection.new(variable_cost_params)
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @variableCost = VariableCost.find(params[:id])
    @variableCost.assign_attributes(params[:variable_cost_params])
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @variableCost = VariableCost.find(params[:id])
    @variableCost.destroy
    redirect_to :variable_costs
  end

  private

  def variable_cost_params
    params.require(:variable_cost)
  end
end
