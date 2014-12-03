namespace :db do
  desc "Erase and fill database"
  task :populate => :environment do
  	5.times do |n|
  		Event.create(:title => "event_#{n}",:location => "location_#{n}", :description => "Lorem ipsum_#{n}")
  	end
  	p "Created Events"
  end
end