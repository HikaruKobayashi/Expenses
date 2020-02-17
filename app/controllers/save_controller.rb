class SaveController < ApplicationController
  def index
    @save = Save.all
    # 総貯金
    gon.money_sum = Save.sum(:money)
    # 月毎の総貯金 単位1万 TO DO DRY原則に反してる感がすごい
    gon.money_month_1 = Save.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_2 = Save.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_3 = Save.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_4 = Save.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_5 = Save.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_6 = Save.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_7 = Save.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_8 = Save.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_9 = Save.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_10 = Save.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_11 = Save.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_12 = Save.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # 1月から12月
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
  end

  def show
    @save = Save.find(params[:id])
  end

  def new
    @save = SaveCollection.new
  end

  def edit
    @save = Save.find(params[:id])
  end

  def create
    @save = SaveCollection.new(saves_params)
    if @save.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update
    @save = Save.find(params[:id])
    @save.assign_attributes(save_params)
    if @save.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def destroy
    @save = Save.find(params[:id])
    @save.destroy
    redirect_to root_path
  end

  def report
    @save = Save.all
    # 総収入
    gon.money_sum = Save.sum(:money)
    # 年毎の総収入 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_year_1 = Save.where(created_at: "2020-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_2 = Save.where(created_at: "2019-01-01".in_time_zone.all_year).sum(:money) / 10000
    gon.money_year_3 = Save.where(created_at: "2018-01-01".in_time_zone.all_year).sum(:money) / 10000
    # 月毎の総収入 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_month_1 = Save.where(created_at: "2020-01-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_2 = Save.where(created_at: "2020-02-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_3 = Save.where(created_at: "2020-03-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_4 = Save.where(created_at: "2020-04-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_5 = Save.where(created_at: "2020-05-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_6 = Save.where(created_at: "2020-06-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_7 = Save.where(created_at: "2020-07-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_8 = Save.where(created_at: "2020-08-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_9 = Save.where(created_at: "2020-09-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_10 = Save.where(created_at: "2020-10-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_11 = Save.where(created_at: "2020-11-01".in_time_zone.all_month).sum(:money) / 10000
    gon.money_month_12 = Save.where(created_at: "2020-12-01".in_time_zone.all_month).sum(:money) / 10000
    # 週間レポート 単位1万円 TO DO DRY原則に反してる感がすごい
    gon.money_7 = Save.where(created_at: 6.day.ago.all_day).sum(:money) / 10000
    gon.money_6 = Save.where(created_at: 5.day.ago.all_day).sum(:money) / 10000
    gon.money_5 = Save.where(created_at: 4.day.ago.all_day).sum(:money) / 10000
    gon.money_4 = Save.where(created_at: 3.day.ago.all_day).sum(:money) / 10000
    gon.money_3 = Save.where(created_at: 2.day.ago.all_day).sum(:money) / 10000
    gon.money_2 = Save.where(created_at: 1.day.ago.all_day).sum(:money) / 10000
    gon.money_1 = Save.where(created_at: Time.zone.now.all_day).sum(:money) / 10000
    # ラベル
    gon.year = ["2018年", "2019年", "2020年"]
    gon.month = ["1月", "2月", "3月", "4月", "5月", "6月","7月", "8月", "9月", "10月", "11月", "12月"]
    gon.week = ["7日前", "6日前", "5日前", "4日前", "3日前", "昨日", "今日"]
  end

  private

  def save_params
    params.require(:save).permit(:name, :content, :money)
  end
  # 一括専用
  def saves_params
    params.require(:save)
  end
end
