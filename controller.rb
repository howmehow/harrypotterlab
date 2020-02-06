require("sinatra")
require("sinatra/contrib/all")

require_relative("./models/student")
require_relative("./models/house")
also_reload("./models/*")

get "/hogwarts" do
  @students = Student.all()
  erb(:index)
end

get "/hogwarts/new" do
  @houses = House.all()
  erb(:new)
end

post "/hogwarts" do
  @students = Student.new(params)
  @students.save()
  redirect "/hogwarts"
end

get "/hogwarts/houses" do
  @houses = House.all()
  erb(:houses)
end
