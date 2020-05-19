FactoryBot.define do
	factory :food, class: Food do
		user_id { 1 }
		category_id { 1 } 
		name { "豚肉" }
		quantity { "200グラム" }
		purchase_date { "2020/05/01" }
		expiry_date { "2020/05/01" }
		wish_list { true }
	end
end