FactoryBot.define do
  factory :admin do
    email { "iepoke@admin.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end