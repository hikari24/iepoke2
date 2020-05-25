class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'http://iepoke.work'
    mail(to: user.email, subject: '会員登録完了のお知らせ')
  end

  #pluckでUserのemailを全て取得
  #default to: -> { User.pluck(:email) }

  def expiry_date_foods
    users = User.all
    @url = 'http://iepoke.work'
    #@user = user
  	#@foods = user.foods
    #@foods = food.where(expiry_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

    #users.each do |user|
    #  @foods = user.foods
    #  @foods = food.where(expiry_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)
    #end

    mail to: users.map{|user| user.email}
  	mail subject: '本日までの消費期限の食材についてお知らせ'


  end
end
