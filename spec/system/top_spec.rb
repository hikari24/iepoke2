require 'rails_helper'

describe 'トップページのテスト' do
	before do
		visit root_path
	end
	context '表示の確認' do
		it '新規登録ボタンが表示される' do
			expect(page).to have_button '新規登録'
		end
		it 'ログインボタンが表示される' do
			expect(page).to have_button 'ログイン'
		end
	end
	context '新規登録画面に遷移' do
		it '遷移できる' do
			click_on '新規登録', match: :first
			expect(current_path).to eq(new_user_registration_path)
		end
	end
	context 'ログイン画面に遷移' do
		it '遷移できる' do
			click_on 'ログイン', match: :first
			expect(current_path).to eq(new_user_session_path)
		end
	end
end