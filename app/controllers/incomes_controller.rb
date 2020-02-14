class IncomesController < ApplicationController
  def index
    @income = Income.all
    # 総収入
    gon.money_sum = Income.sum(:money)
    # 月毎の総収入 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_month_1 = Income.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_2 = Income.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_3 = Income.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_4 = Income.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_5 = Income.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_6 = Income.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_7 = Income.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_8 = Income.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_9 = Income.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_10 = Income.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_11 = Income.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_12 = Income.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # 1月から12月
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
  end

  def show
    @income = Income.find(params[:id])
  end

  def new
    @income = IncomeCollection.new
  end

  def edit
    @income = Income.find(params[:id])
  end

  def create
    @income = IncomeCollection.new(incomes_params)
    if @income.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @income = Income.find(params[:id])
    @income.assign_attributes(income_params)
    if @income.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to :incomes
  end

  private

  def income_params
    params.require(:income).permit(:name, :content, :money, :label)
  end
  # 一括専用
  def incomes_params
    params.require(:income)
  end
end
