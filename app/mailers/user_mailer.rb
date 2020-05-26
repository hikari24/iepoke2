class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://iepoke.work'
    mail(to: user.email, subject: '会員登録完了のお知らせ')
  end

  #pluckでUserのemailを全て取得
  #default to: -> { User.pluck(:email) }

  def self.expiry_date_mail
    @users = User.all
    @users.each do |user|
      UserMailer.expiry_date_foods(user).deliver_now
    end
  end

  def expiry_date_foods(user)
    #users = User.all
    @user = user
    @url = 'http://iepoke.work'
  	#@foods = user.foods
    #@foods = food.where(expiry_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

    #mail to: users.map{|user| user.email}
  	#mail subject: '本日までの消費期限の食材についてお知らせ'
    mail(to: user.email, subject: '本日までの消費期限の食材についてお知らせ')
  end
end
