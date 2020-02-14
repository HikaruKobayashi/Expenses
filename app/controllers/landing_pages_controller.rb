class LandingPagesController < ApplicationController
  def index
    @income = Income.all
    @variable_cost = VariableCost.all
    @fixed_cost = FixedCost.all

    gon.income_sum = Income.sum(:money) / 10000
    gon.variable_cost_sum = VariableCost.sum(:money) / 10000
    gon.fixed_cost_sum = FixedCost.sum(:money) / 10000

    # 現在の経済状況を計算する？
  end

  def show; end

  def setting; end

  def report; end
end