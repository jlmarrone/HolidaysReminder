ActiveAdmin.register Holiday do

  filter :description
  filter :holiday_date
  filter :country, :as => :select , :label_method => :Country_Name

  index do
    id_column
    column :description
    column :holiday_date
    column :created_at
    default_actions
  end

  form do |f|
      f.inputs "Holiday" do
        f.input :description
        f.input :holiday_date, :as => :date
        f.input :country, :as => :select , :label_method => :Country_Name, :prompt => "Select a Country"
        f.input :user, :as => :select , :label_method => :name, :prompt => "Select User"
      end
      f.buttons
    end  

    show do
      panel "Holiday Details" do
         attributes_table_for holiday do
          row("Description") { holiday.description }
          row("Date") {holiday.holiday_date}
          row("Created at") { holiday.created_at}
          row("Last Modification") {holiday.updated_at}
          row("User") {holiday.user.name}
        end
      end
 
      active_admin_comments
    end
end
