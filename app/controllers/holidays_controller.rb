class HolidaysController <  InheritedResources::Base
 belongs_to :user

 respond_to :html
 
 def create
  create! {user_path(current_user)}
 end 

 def update
  update! {user_path(current_user)}
 end  

 def destroy
  update! {user_path(current_user)}
 end 
end