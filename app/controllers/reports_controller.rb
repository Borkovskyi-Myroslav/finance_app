class ReportsController < ApplicationController

  def index
  end

  def report_by_category
    puts (params)
  end

  def report_by_dates
    puts (params)
  end

  # don`t understand what I do
  def analytics
    #fetch recors by parameters: operations = Operation.where(transaction_type: (params[:transaction_type]))
    #fetch recors by parameters: report = Operation.where('created_at >=?'params{:start_date}) counfused me!!
    #fetch recors by parameters: category = Category.where(category_id: (params[:category_id]))
  end

end