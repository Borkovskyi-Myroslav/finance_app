class Category < ApplicationRecord
    has_many :operations

    paginates_per 5

    validates :name, presence: true, uniqueness: true

    validates :description, presence: true
end
