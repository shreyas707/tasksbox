15.times do 
	client = Client.new
	client.name = Faker::Name.first_name
	client.company = Faker::Company.name
	client.email = Faker::Internet.free_email(client.name)
	client.mobile = Faker::Number.number(10)
	client.website = Faker::Internet.domain_name
	client.save
end

100.times do
	project = Project.new
	project.name = Faker::App.name
	project.description = Faker::Lorem.sentence
	project.start_date = Faker::Date.between(Date.today.beginning_of_year, Date.today)
	project.end_date = Faker::Date.between(project.start_date, project.start_date + 3.months)
	project.client_id = Client.all.pluck(:id).sample
	project.save
end

#add status to projects table
Project.all.each {|project| project.update_attributes(status: ["new", "completed", "on-going"].sample)}

Project.all.each do |project|
	project.status = ["new", "completed", "on-going"].sample
	project.save
end

200.times do
	task = Task.new
	task.title = ["logo design", "web design", "vendor finalization", "client metting"].sample
	project_id = Project.all.pluck(:id).sample
	project = Project.find(project_id)
	task.due_date = Faker::Date.between(project.start_date, project.start_date + 1.week)
	task.is_completed = [true, false].sample
	task.project_id = project.id
	task.save
end