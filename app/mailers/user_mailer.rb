class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    @url = 'http://iepoke.work'
    mail(from: 'iepoke.dwc@gmail.com', to: user.email, subject: '会員登録完了のお知らせ')
  end

  default to: -> { User.pluck(:email) }, from: 'iepoke.dwc@gmail.com'

  def expiry_date_foods
    @url = 'http://iepoke.work'
    #@user = user
  	#@foods = user.foods
    #@foods = food.where(expiry_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

    #pluckでUserのemailを全て取得
  	#default to: -> { User.pluck(:email) }, from: 'iepoke.dwc@gmail.com'

  	mail(subject: '本日までの消費期限の食材についてお知らせ')
  end
end
