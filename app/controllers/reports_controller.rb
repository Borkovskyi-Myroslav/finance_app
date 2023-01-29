class ReportsController < ApplicationController

  def index
  end

  # def report_by_category
  #   puts (params)
  # end

  # def report_by_dates
  #   puts (params)
  # end

  # don`t understand what I do
  def analytics

    @records = Operation.all
    @records = @records.where(transaction_type: params[:transaction_type]) if params[:transaction_type].present?
    @records = @records.where(category_id: params[:category_id]) if params[:category_id].present?
    @records = @records.where('created_at >= ?', params[:start_date]) if params[:start_date].present?
    @records = @records.where('created_at <= ?', params[:end_date]) if params[:end_date].present?


    #params.permit(end_date:[])
    #end_date: params[:end_date]
    #@records = @records.where(end_date: params[:end_date]) if params[:end_date].present?
    #params [:start_date]

  end



  private

  def by_date?
    params[:comite]  == "By Date"
  end

  def by_category?
    params[:comite]  == "By Category"
  end

  # need it?
  # def record_params
  #   params.require(:record).permit(:start_date, :end_date, :transaction_type, :category_id)
  # end


end