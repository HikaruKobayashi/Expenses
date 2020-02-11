class VariableCostsController < ApplicationController
  def index
    @variableCost = VariableCost.all
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
    @variableCost = VariableCostCollection.new(variable_cost_params)
    if @variableCost.save
      redirect_to ('/')
    else
      render :new
    end
  end

  def update; end

  def destroy; end

  private

  def variable_cost_params
    params.require(:variable_cost)
  end
end
