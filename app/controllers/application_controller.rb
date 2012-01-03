class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  private

  #def current_user
  #@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #end

  def call_rake(task, options = {})
  options[:rails_env] ||= Rails.env
  args = options.map { |n, v| "#{n.to_s.upcase}='#{v}'" }
  system "/usr/bin/rake #{task} #{args.join(' ')} --trace 2>&1 >> #{Rails.root}/log/rake.log &"
  end

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || select_home_path(current_user)
  end 

  def after_update_path_for(resource)
    select_home_path(current_user)
  end
end
