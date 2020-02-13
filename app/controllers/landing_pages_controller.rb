class LandingPagesController < ApplicationController
  def index
    gon.income_sum = Income.sum(:money) / 10000
    gon.variable_cost_sum = VariableCost.sum(:money) / 10000
    gon.fixed_cost_sum = FixedCost.sum(:money) / 10000
  end

  def show; end
end