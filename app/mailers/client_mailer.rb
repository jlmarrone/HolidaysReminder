class ClientMailer < ActionMailer::Base
  default :from => "jlmarrone@gmail.com"

  def holiday_notification(client,holidays)
    @client = client
    @holidays = holidays
    mail(:to => "#{client.name} <#{client.email}>", :subject => "Holiday Notification")
  end
end
