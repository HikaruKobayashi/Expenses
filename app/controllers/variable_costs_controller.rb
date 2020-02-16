class VariableCostsController < ApplicationController
  def index
    @variableCost = VariableCost.order(created_at: :desc)
    # 総変動費
    gon.money_sum = VariableCost.sum(:money)
    # 日毎の総変動費 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_day = VariableCost.group("date(created_at)").sum(:money)
    # 曜日毎？
    gon.money_7 = VariableCost.where(created_at: 6.day.ago.all_day).sum(:money) / 1000
    gon.money_6 = VariableCost.where(created_at: 5.day.ago.all_day).sum(:money) / 1000
    gon.money_5 = VariableCost.where(created_at: 4.day.ago.all_day).sum(:money) / 1000
    gon.money_4 = VariableCost.where(created_at: 3.day.ago.all_day).sum(:money) / 1000
    gon.money_3 = VariableCost.where(created_at: 2.day.ago.all_day).sum(:money) / 1000
    gon.money_2 = VariableCost.where(created_at: 1.day.ago.all_day).sum(:money) / 1000
    gon.money_1 = VariableCost.where(created_at: Time.zone.now.all_day).sum(:money) / 1000
    
    gon.week = ["7日前", "6日前", "5日前", "4日前", "3日前", "昨日", "今日"]
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
    @variableCost = VariableCostCollection.new(variable_costs_params)
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @variableCost = VariableCost.find(params[:id])
    @variableCost.assign_attributes(variable_cost_params)
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

  def report
    @variableCost = VariableCost.all
    # 総変動費
    gon.money_sum = VariableCost.sum(:money)
    # 年毎の総変動費 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_year_1 = VariableCost.where(created_at: "2020-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_2 = VariableCost.where(created_at: "2019-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_3 = VariableCost.where(created_at: "2018-01-01".in_time_zone.all_year).sum(:money) / 10000
    # 月毎の総固定費 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_month_1 = VariableCost.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_2 = VariableCost.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_3 = VariableCost.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_4 = VariableCost.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_5 = VariableCost.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_6 = VariableCost.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_7 = VariableCost.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_8 = VariableCost.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_9 = VariableCost.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_10 = VariableCost.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_11 = VariableCost.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_12 = VariableCost.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # 日毎の総変動費 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_day = VariableCost.group("date(created_at)").sum(:money)
    # 週間レポート 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_7 = VariableCost.where(created_at: 6.day.ago.all_day).sum(:money) / 1000
    gon.money_6 = VariableCost.where(created_at: 5.day.ago.all_day).sum(:money) / 1000
    gon.money_5 = VariableCost.where(created_at: 4.day.ago.all_day).sum(:money) / 1000
    gon.money_4 = VariableCost.where(created_at: 3.day.ago.all_day).sum(:money) / 1000
    gon.money_3 = VariableCost.where(created_at: 2.day.ago.all_day).sum(:money) / 1000
    gon.money_2 = VariableCost.where(created_at: 1.day.ago.all_day).sum(:money) / 1000
    gon.money_1 = VariableCost.where(created_at: Time.zone.now.all_day).sum(:money) / 1000
    # ラベル
    gon.year = ["2018年", "2019年", "2020年"]
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
    gon.week = ["7日前", "6日前", "5日前", "4日前", "3日前", "昨日", "今日"]
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
