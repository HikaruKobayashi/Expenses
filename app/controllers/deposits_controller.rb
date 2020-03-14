class DepositsController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @deposit = current_user.deposits.all
    # 総貯金
    gon.money_sum = current_user.deposits.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 月毎の貯金額 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.deposits.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end
  end

  def show
    @deposit = current_user.deposits.find(params[:id])
  end

  def new
    @deposit = Deposit.new
  end

  def edit
    @deposit = current_user.deposits.find(params[:id])
  end

  def create
    @deposit = Deposit.new(deposit_params)
    @deposit.user_id = current_user.id
    if @deposit.save
      redirect_to deposits_path
    else
      render :new
    end
  end

  def update
    @deposit = current_user.deposits.find(params[:id])
    @deposit.assign_attributes(deposit_params)
    if @deposit.save
      redirect_to deposits_path
    else
      render :new
    end
  end

  def destroy
    @deposit = current_user.deposits.find(params[:id])
    @deposit.destroy
    redirect_to deposits_path
  end

  def report
    @deposit = current_user.deposits.all
     # 総貯金
    gon.money_sum = current_user.deposits.sum(:money)

    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 年毎の貯金 単位1万円
    this_year = t.year
    my_year = []
    year = []
    3.times do |y|
      my_year.push(current_user.deposits.where(created_at: ("#{the_beginning.ago(y.years)}").in_time_zone.all_year).sum(:money) / 10000)
      year.push("#{this_year-y}")
    end
    gon.money_year = my_year.reverse!
    gon.recently_year = year.reverse!

    # 月毎の貯金 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.deposits.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(current_user.deposits.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
    end
    gon.money_week = my_week.reverse!
  end

  private

  def deposit_params
    params.require(:deposit).permit(:name, :content, :money)
  end
end
