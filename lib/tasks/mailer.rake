desc "Send mailing"
task :send_mailing => :environment do

  @today = Date.today
  User.date_notification(@today).each do |user|
    holidays = user.holidays.date_notification(@today)
  
    user.clients.each do |client|
      holiday_notify = client.client_notifications.where(:holiday_id => holidays.map(&:id)).all.map(&:holiday_id)
      holidays_to_mail = holidays.select{|current_holiday| !holiday_notify.include?(current_holiday.id)}    


        unless holidays_to_mail.empty?
             ClientMailer.holiday_notification(client,holidays_to_mail).deliver
         end

         holidays_to_mail.each do |holiday_mail|
            ClientNotification.create(:client_id => client.id, :holiday_id => holiday_mail.id)
         end
     end    
  end 
end 

