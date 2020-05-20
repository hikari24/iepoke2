require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'バリデーションのテスト' do
    let(:user) { create(:user) }
    subject { test_user.valid? }
    context 'nameカラム' do
      let(:test_user) { user }
      it '空欄でないこと' do
        test_user.name = ''
        is_expected.to eq false;
      end
  	end
  end
	describe 'アソシエーションのテスト' do
	  context 'Categoryモデルとの関係' do
      	it '1:Nとなっている' do
        	expect(User.reflect_on_association(:categories).macro).to eq :has_many
	    end
      end
      context 'Foodモデルとの関係' do
      	it '1:Nとなっている' do
        	expect(User.reflect_on_association(:foods).macro).to eq :has_many
	    end
      end
  	end
end
