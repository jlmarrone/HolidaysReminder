desc "Send mailing1"
task :send_mailing1 => :environment do
 
  User.find_in_batches do |users|
    users.each do |user|
      @holidays = user.holidays.date_notification
    
      user.clients.each do |client|
        @holiday_notify = []
        client.client_notifications.holidays_notificated(@holidays).each do |client_notification|
          @holiday_notify << client_notification.holiday
        end
        @holidays_to_send = @holidays - @holiday_notify
        
        ClientMailer.holiday_notification(client, @holidays_to_send).deliver unless @holidays_to_send.empty?

        @holidays_to_send.each do |holiday|
          ClientNotification.create(:client => client, :holiday => holiday)
        end
      end
     
    end
  end
end  
