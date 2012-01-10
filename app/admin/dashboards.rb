ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.

  section "Recent Users", :priority => 1 do
    table_for User.order('id desc').limit(10).each do |customer|
      column(:id)
      column(:name)     {|customer| link_to(customer.name,  admin_user_path(customer)) } 
      column(:email)    {|customer| link_to(customer.email, admin_user_path(customer)) }
    end
  end

  section "Clients", :priority => 2 do
    table_for Client.order('id asc').limit(10).each do |customer|
      column(:id)
      column(:name)     {|customer| link_to(customer.name, admin_client_path(customer)) } 
      column(:email)    {|customer| link_to(customer.email, admin_client_path(customer)) }
    end
  end
  
  section "Holidays", :priority => 3 do
    table_for Holiday.order('id asc').limit(10).each do |holiday|
      column(:id)
      column(:description)  {|holiday| link_to(holiday.description, admin_holiday_path(holiday)) } 
      column(:holiday_date)
    end
  end

end
