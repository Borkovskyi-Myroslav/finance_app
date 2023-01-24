class Operation < ApplicationRecord
  belongs_to :category

  enum transaction_type: { costs: 0, income: 10 }

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :odate, :description, presence: true

end
