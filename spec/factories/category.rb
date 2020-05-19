FactoryBot.define do
	factory :category, class: Category do
		user_id { 1 }
		name { "肉類" }
	end
end