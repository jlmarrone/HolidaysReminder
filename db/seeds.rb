# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
[
  {:State_Name => "Tucuman"},
  {:State_Name => "Salta"},
  {:State_Name => "Cordoba"},
  {:State_Name => "Buenos Aires"}
].each do |attributes|
  State.find_or_create_by_State_Name(attributes)
end

[
  {:Country_Name => "Argentina"},
  
].each do |attributes|
  Country.find_or_create_by_Country_Name(attributes)
end