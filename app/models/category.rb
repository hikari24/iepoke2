class Category < ApplicationRecord
	belongs_to :user
	has_many :foods, dependent: :destroy

	validates :name, presence: true, length: { maximum: 15 }
end
