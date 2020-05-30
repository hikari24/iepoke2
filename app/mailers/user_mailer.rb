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
    @user = user
    @url = 'http://iepoke.work'
  	food = Food.where(user_id:user.id)
    @foods = food.where(expiry_date: [100.days.ago..Date.today])

    mail(to: user.email, subject: '本日までの消費期限の食材についてお知らせ')
  end
end
