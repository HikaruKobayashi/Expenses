class IncomesController < ApplicationController
  def index
    @income = Income.all
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
    @income = IncomeCollection.new(income_params)
    if @income.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def income_params
    params.require(:income)
  end
end
