class FixedCostsController < ApplicationController
  def index
    @fixedCost = FixedCost.all
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
    @fixedCost = FixedCostCollection.new(fixed_cost_params)
    if @fixedCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def fixed_cost_params
    params.require(:fixed_cost)
  end
end