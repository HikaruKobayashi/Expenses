class IncomesController < ApplicationController
  def index
    @income = Income.all
    # 総収入
    gon.money_sum = Income.sum(:money)

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 月毎の収入 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(Income.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end
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

    # 今日を取得する
    t = Time.now

    # 今年の1月1日を取得する
    the_beginning = t.beginning_of_year

    # 年毎の収入 単位1万円
    this_year = t.year
    my_year = []
    year = []
    3.times do |y|
      my_year.push(Income.where(created_at: ("#{the_beginning.ago(y.years)}").in_time_zone.all_year).sum(:money) / 10000)
      year.push("#{this_year-y}")
    end
    gon.money_year = my_year.reverse!
    gon.recently_year = year.reverse!

    # 月毎の収入 単位1万円
    gon.money_month = []
    gon.month = []
    12.times do |m|
      gon.money_month.push(Income.where(created_at: ("#{the_beginning.since(m.month)}").in_time_zone.all_month).sum(:money) / 10000)
      gon.month.push("#{m+1}月")
    end

    # 今日から数えて7日間
    my_week = []
    gon.week = ["6日前", "5日前", "4日前", "3日前", "2日前", "昨日", "今日"]
    7.times do |w|
      my_week.push(Income.where(created_at: ("#{t.ago(w.days)}").in_time_zone.all_day).sum(:money) / 10000)
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
