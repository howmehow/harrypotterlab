require("sinatra")

require("sinatra/contrib/all")

require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")

get "/hogwarts" do
  erb(:main)
end
get "/hogwarts/students" do
  @students = Student.all()
  erb(:index)
end

get "/hogwarts/new" do
  @houses = House.all()
  erb(:new)
end

post "/hogwarts/students" do
  @students = Student.new(params)
  @students.save()
  redirect "/hogwarts/students"
end

get "/hogwarts/houses" do
  @houses = House.all()
  erb(:houses)
end

post "/hogwarts/:id/delete" do
  student = Student.find(params[:id])
  student.delete()
  redirect "/hogwarts/students"
end
