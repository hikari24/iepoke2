require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:category) { create(:category, user_id: user.id) }
    let!(:food) { create(:food, user_id: user.id, category_id: category.id)}

    context 'nameカラム' do
        it '空欄でないこと' do
          food.name = ''
          expect(food.valid?).to eq false;
        end
        it '15字以内であること' do
          food.name = Faker::Lorem.characters(number:16)
          expect(food.valid?).to eq false;
        end
    end
    context 'quantityカラム' do
    	it '空欄でないこと' do
          food.quantity = ''
          expect(food.valid?).to eq false;
        end
    end
  end
  describe 'アソシエーションのテスト' do
  	context 'Userモデルとの関係' do
      	it 'N:1となっている' do
        	expect(Food.reflect_on_association(:user).macro).to eq :belongs_to
	    end
    end
    context 'Categoryモデルとの関係' do
      	it 'N:1となっている' do
        	expect(Food.reflect_on_association(:category).macro).to eq :belongs_to
	    end
      end
  end
end
