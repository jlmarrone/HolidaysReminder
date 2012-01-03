class HomeController < ApplicationController
  
  def index
    if user_signed_in?
        redirect_to select_home_path(current_user)
    end
  end

  def select 
  end

  def delivering
   call_rake :send_mailing
   flash[:notice] = "Delivering mailing"
   redirect_to select_home_path(current_user)
  end  
end
