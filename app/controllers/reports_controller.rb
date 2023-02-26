class ReportsController < ApplicationController

  def index
  end

  def analytics

    @records = Operation.all

    @records = @records.where(transaction_type: params[:transaction_type]) if params[:transaction_type].present?
    @records = @records.by_category(params[:category_id])


    @records = @records.where('odate >= ?', params[:start_date]) if params[:start_date].present?
    @records = @records.where('odate <= ?', params[:end_date]) if params[:end_date].present?




    # Report by Category
    @by_category = @records.joins(:category).group('categories.name').sum("amount")

    # Report by Date
    @by_date = @records.group("strftime('%m-%d-%Y', odate)").sum("amount")

  end

  private

  def by_date?
    params[:comite] == "By Date"
  end

  def by_category?
    params[:comite] == "By Category"
  end

end