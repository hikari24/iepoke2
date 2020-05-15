class UserMailer < ApplicationMailer
  def welcome_email(user)
    @user = user
    mail(from: 'from@example.com', to: user.email, subject: '会員登録完了のお知らせ')
  end
end
