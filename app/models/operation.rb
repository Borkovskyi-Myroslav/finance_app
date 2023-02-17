class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 10

  enum transaction_type: { costs: 0, income: 10 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, :description,  presence: true

  def self.report_by_category(start_date, end_date)
    Operation
      .joins(:category)
      .where('odate BETWEEN ? AND ?', start_date, end_date)
      .group('categories.name')
      .sum(:amount)
  end

  def self.report_by_dates(start_date, end_date)
    Operation
      .where('odate BETWEEN ? AND ?', start_date, end_date)
      .group(:odate)
      .sum(:amount)
  end

end
