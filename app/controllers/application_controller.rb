class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
  	def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
	#新規登録時(sign_up)にnameのというキーのパラメータを追加で許可する
	devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
	#登録内容編集時(update)にnameのというキーのパラメータを追加で許可する

	end

end
