class Food < ApplicationRecord
	belongs_to :user
	belongs_to :category

	validates :category, presence: true
	validates :name, presence: true, length: { maximum: 20 }
	validates :quantity, presence: true
	validates :expiry_date, presence: true
	validates :wish_list, inclusion: { in: [true, false] }

end
