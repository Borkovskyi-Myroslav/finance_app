class ReportsController < ApplicationController

  def index
  end

  def analytics

    @records = Operation.all
    # тут мені не получилось прописати Scop для транзикації
    @records = @records.where(transaction_type: params[:transaction_type]) if params[:transaction_type].present?
    @records = @records.by_category(params[:category_id])

    # Мені це більше підходить бо тут є 'odate >= ?', воно краще сортує мені під час вибору дат
    @records = @records.where('odate >= ?', params[:start_date]) if params[:start_date].present?
    @records = @records.where('odate <= ?', params[:end_date]) if params[:end_date].present?

    # я можу якось запхати 'odate >= ?' 'odate <= ?' в нижній рядок?
    #@records = @records.by_dates(params[:start_date], params[:end_date])


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