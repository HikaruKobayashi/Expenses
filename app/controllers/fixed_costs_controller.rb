class FixedCostsController < ApplicationController
  def index
    @fixedCost = FixedCost.all
     # 総固定費
    gon.money_sum = FixedCost.sum(:money)
    # 月毎の総固定費 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_month_1 = FixedCost.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_2 = FixedCost.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_3 = FixedCost.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_4 = FixedCost.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_5 = FixedCost.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_6 = FixedCost.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_7 = FixedCost.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_8 = FixedCost.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_9 = FixedCost.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_10 = FixedCost.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_11 = FixedCost.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_12 = FixedCost.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # 1月から12月
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
  end

  def show
    @fixedCost = FixedCost.find(params[:id])
  end

  def new
    @fixedCost = FixedCostCollection.new
  end

  def edit
    @fixedCost = FixedCost.find(params[:id])
  end

  def create
    @fixedCost = FixedCostCollection.new(fixed_costs_params)
    if @fixedCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @fixedCost = FixedCost.find(params[:id])
    @fixedCost.assign_attributes(fixed_cost_params)
    if @fixedCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @fixedCost = FixedCost.find(params[:id])
    @fixedCost.destroy
    redirect_to :fixed_costs
  end

  private

  def fixed_cost_params
    params.require(:fixed_cost).permit(:name, :content, :money)
  end

  def fixed_costs_params
    params.require(:fixed_cost)
  end
end