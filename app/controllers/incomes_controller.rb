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

  # エラー対応中
  # def new
  #   @income = IncomeCollection.new
  # end

  def new
    @income = Income.new
  end

  def edit
    @income = Income.find(params[:id])
  end

  # エラー対応中
  # def create
  #   @income = IncomeCollection.new(incomes_params)
  #   if @income.save
  #     redirect_to ('/')
  #   else
  #     render :new
  #   end
  # end

  def create
    @income = Income.create(income_params)
    @income.save!
    redirect_to('/')
  end

  # エラー対応中
  # def update
  #   @income = Income.find(params[:id])
  #   @income.assign_attributes(income_params)
  #   if @income.save
  #     redirect_to ('/')
  #   else
  #     render :new
  #   end
  # end

  def update
    @income = Income.find(params[:id])
    @income.update(income_params)
    redirect_to('/')
  end

  def destroy
    @income = Income.find(params[:id])
    @income.destroy
    redirect_to :incomes
  end

  def report
    @income = Income.all
    # 総収入
    gon.money_sum = Income.sum(:money)
    # 年毎の総収入 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_year_1 = Income.where(created_at: "2020-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_2 = Income.where(created_at: "2019-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_3 = Income.where(created_at: "2018-01-01".in_time_zone.all_year).sum(:money) / 10000
    # 月毎の総収入 単位1万円 TO DO DRY原則に反してる感がすごい
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
    # 週間レポート 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_7 = Income.where(created_at: 6.day.ago.all_day).sum(:money) / 10000
    gon.money_6 = Income.where(created_at: 5.day.ago.all_day).sum(:money) / 10000
    gon.money_5 = Income.where(created_at: 4.day.ago.all_day).sum(:money) / 10000
    gon.money_4 = Income.where(created_at: 3.day.ago.all_day).sum(:money) / 10000
    gon.money_3 = Income.where(created_at: 2.day.ago.all_day).sum(:money) / 10000
    gon.money_2 = Income.where(created_at: 1.day.ago.all_day).sum(:money) / 10000
    gon.money_1 = Income.where(created_at: Time.zone.now.all_day).sum(:money) / 10000
    # ラベル
    gon.year = ["2018年", "2019年", "2020年"]
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
    gon.week = ["7日前", "6日前", "5日前", "4日前", "3日前", "昨日", "今日"]
  end

  private

  def income_params
    params.require(:income).permit(:name, :content, :money)
  end
  # 一括専用
  def incomes_params
    params.require(:income)
  end
end
