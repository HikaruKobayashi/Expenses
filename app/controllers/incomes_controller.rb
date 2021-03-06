class IncomesController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :destroy]

  def index
    @income = current_user.incomes.all
    # 総収入
    gon.money_sum = current_user.incomes.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 月毎の収入 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.incomes.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end
  end

  def show
    @income = current_user.incomes.find(params[:id])
  end

  # エラー対応中
  # def new
  #   @income = IncomeCollection.new
  # end

  def new
    @income = Income.new
  end

  def edit
    @income = current_user.incomes.find(params[:id])
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
    @income = Income.new(income_params)
    @income.user_id = current_user.id
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
    @income = current_user.incomes.find(params[:id])
    @income.update(income_params)
    redirect_to('/')
  end

  def destroy
    @income = current_user.incomes.find(params[:id])
    @income.destroy
    redirect_to :incomes
  end

  def report
    @income = Income.all
    # 総収入
    gon.money_sum = current_user.incomes.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 年毎の収入 単位1万円
    this_year = t.year
    my_year = []
    year = []
    3.times do |y|
      my_year.push(current_user.incomes.where(created_at: ("#{the_beginning.ago(y.years)}").in_time_zone.all_year).sum(:money) / 10000)
      year.push("#{this_year-y}")
    end
    gon.money_year = my_year.reverse!
    gon.recently_year = year.reverse!

    # 月毎の収入 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(current_user.incomes.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(current_user.incomes.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
    end
    gon.money_week = my_week.reverse!
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
