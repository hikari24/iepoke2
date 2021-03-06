# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
env :PATH, ENV['PATH'] # 絶対パスから相対パス指定
set :output, 'log/cron.log' # ログファイルの出力先
# "/path/to/my/cron_log.log"
#set :environment, :development # ジョブの実行環境の指定
set :environment, :production
every 1.days, at: '8:00 am' do
#every 5.minutes do
#every 6.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end

# Learn more: http://github.com/javan/whenever

# Rails内のメソッド実行
  #runner "UserMailer.expiry_date_foods.deliver"
  runner "UserMailer.expiry_date_mail"
end
