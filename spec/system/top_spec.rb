require 'rails_helper'

describe 'トップページの遷移テスト' do
	before do
		visit root_path
	end
	context '新規登録画面に遷移' do
		it '遷移できる' do
			visit root_path
			click_button '新規登録'
			expect(current_path).to eq(new_user_registration_path)
		end
	end
	context 'ログイン画面に遷移' do
		it '遷移できる' do
			click_button 'ログイン'
			expect(current_path).to eq(new_user_session_path)
		end
	end
end