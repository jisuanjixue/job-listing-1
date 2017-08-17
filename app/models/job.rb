class Job < ApplicationRecord
	belongs_to :category
    has_many :resumes
    validates :wage_lower_bound, presence: true
    validates :wage_upper_bound, presence: true
    validates :wage_lower_bound, numericality: { greater_than: 0 }
end
