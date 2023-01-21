class ReportsController < ApplicationController
  def index
  end

  def report_by_category
    puts params[:btn_category] # why?
   
    # puts params
  end

  def report_by_dates
    puts (params) # why?
  end
end
