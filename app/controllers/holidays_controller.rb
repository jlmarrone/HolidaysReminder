class HolidaysController <  InheritedResources::Base
 
 def create
   create! {select_home_path(current_user)}
 end 

 def update
   update! {select_home_path(current_user)}
 end  

 def destroy
   update! {select_home_path(current_user)}
 end 
end