class ReportsController < ApplicationController

  def index
  end

  # def report_by_category
  #   puts (params)
  # end

  # def report_by_dates
  #   puts (params)
  # end


  def analytics

    @records = Operation.all
    @records = @records.where(transaction_type: params[:transaction_type]) if params[:transaction_type].present?
    @records = @records.where(category_id: params[:category_id]) if params[:category_id].present?
    @records = @records.where('odate >= ?', params[:start_date]) if params[:start_date].present?
    @records = @records.where('odate <= ?', params[:end_date]) if params[:end_date].present?

    # Report by Category
    @by_category = @records.joins(:category).group('categories.name').sum("amount")

    #Report by Date
    @by_date = @records.group("strftime('%d-%m-%Y', odate)").sum("amount")

  end



  private

  def by_date?
    params[:comite]  == "By Date"
  end

  def by_category?
    params[:comite]  == "By Category"
  end



end