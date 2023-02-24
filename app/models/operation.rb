class Operation < ApplicationRecord
  belongs_to :category

  paginates_per 10

  enum transaction_type: { costs: 0, income: 10 }

  scope :by_dates, ->(start, the_end) { where('odate BETWEEN ? AND ?', start, the_end) if start.present? && the_end.present? }
  scope :by_category, ->(test_category) { joins(:category).where(category: test_category) if test_category.present? }


  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, :description, presence: true

  def self.report_by_category(start_date, end_date)
    Operation
      .joins(:category)
      .by_dates(start_date, end_date)
      .group('categories.name')
      .sum(:amount)
  end

  def self.report_by_dates(start_date, end_date)
    Operation
      .by_dates(start_date, end_date)
      .group(:odate)
      .sum(:amount)
  end

end
