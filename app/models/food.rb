class Food < ApplicationRecord
	belongs_to :user
	belongs_to :category
	attachment :image

	validates :name, presence: true, length: { maximum: 15 }
	validates :quantity, presence: true
	validates :purchase_date, presence: true
	validates :expiry_date, presence: true
	validates :wish_list, inclusion: { in: [true, false] }

end
