ActiveAdmin.register Client do

  filter :name
  filter :email
  filter :country, :as => :select , :label_method => :Country_Name

  index do
    id_column
    column :name
    column :email
    column :created_at
    default_actions
  end

  form do |f|
      f.inputs "Client" do
        f.input :name
        f.input :email
        f.input :country, :as => :select , :label_method => :Country_Name, :prompt => "Select a Country"
        f.input :user, :as => :select , :label_method => :name, :prompt => "Select User"  
    end
      f.buttons
    end

    show do
      panel "Client Details" do
         attributes_table_for client do
          row("Name") { client.name }
          row("Email") { client.email }
          row("Country") {client.country.Country_Name}
          row("Created at") { client.created_at}
          row("Last Modification") {client.updated_at}
          row("User") {client.user.name}
        end
      end
 
      active_admin_comments
    end  
end
