class IncomesController < ApplicationController
  def index
    @income = Income.all
  end
end
