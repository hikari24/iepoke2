require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    let!(:category) { create(:category, user_id: user.id) }
      context 'nameカラム' do
        it '空欄でないこと' do
          category.name = ''
          expect(category.valid?).to eq false;
        end
        it '15字以内であること' do
          category.name = Faker::Lorem.characters(number:16)
          expect(category.valid?).to eq false;
        end
      end
  end
  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Category.reflect_on_association(:user).macro).to eq :belongs_to
      end
    end
  end

end
