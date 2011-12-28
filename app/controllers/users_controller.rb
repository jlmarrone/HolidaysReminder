 class UsersController < InheritedResources::Base

 respond_to :html
  
  def delivering
   call_rake :send_mailing
   flash[:notice] = "Delivering mailing"

   redirect_to user_url
  end  
end 