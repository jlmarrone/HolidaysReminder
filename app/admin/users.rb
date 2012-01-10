ActiveAdmin.register User do

  filter :name
  filter :email
  filter :country, :as => :select , :label_method => :Country_Name
  filter :state, :as => :select, :label_method => :State_Name

  index do
    id_column
    column :name
    column :email
    column :created_at
    default_actions
  end  

  form :html => { :enctype => "multipart/form-data" } do |f|
      f.inputs "User" do
        f.input :name
        if f.object.new_record?
          f.input :password
          f.input :password_confirmation
        end
        f.input :current_password, :as => :hidden
        f.input :email
        f.input :country, :as => :select , :label_method => :Country_Name, :prompt => "Select a Country"
        f.input :state, :as => :select , :label_method => :State_Name, :prompt => "Select a State"
        f.input :avatar, :as => :file
      end
      f.buttons
  end

  show do
      panel "User Details" do
         attributes_table_for user do
          row("Name") { user.name }
          row("Email") { user.email }
          row("Country") { user.country.Country_Name }
          row("State") { user.state.State_Name }
          row("Created at") { user.created_at }
          row("Last Modification") { user.updated_at }
          row("Profile Image") {image_tag user.avatar.url(:thumb)}
        end
      end
 
      active_admin_comments
    end  
end
