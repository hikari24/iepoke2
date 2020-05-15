class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000'
    mail(from: 'iepoke.dwc@gmail.com', to: user.email, subject: '会員登録完了のお知らせ')
  end

  def expiry_date_foods
  	@food = user.food

  	default to: -> { User.pluck(:email) } #pluckでUserのemailを全て取得
  	mail(from: 'iepoke.dwc@gmail.com', to: user.email, subject: '本日までの消費期限の食材についてお知らせ')
  end
end
