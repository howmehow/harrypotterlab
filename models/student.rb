require_relative("../db/sqlrunner")
class Student
attr_reader :id
attr_accessor :first_name, :second_name, :house_id, :age

  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @first_name = options["first_name"]
    @second_name = options["second_name"]
    @house_id = options["house_id"]
    @age = options["age"].to_i()
  end

  def save()
    sql = "INSERT INTO students (
    first_name, second_name, house_id, age
    ) VALUES ($1,$2,$3,$4)
    RETURNING id"
    values = [@first_name, @second_name, @house_id,@age]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i()
  end

  def delete()
    sql = "DELETE FROM students
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE students
    SET (first_name, second_name, house_id, age) =
    ($1,$2,$3,$4)
    WHERE id = $5"
    values = [@first_name, @second_name, @house_id,@age, @id]
    SqlRunner.run(sql, values)
  end
  def find_house()
    sql = "SELECT houses.* FROM houses
    INNER JOIN students ON students.house_id = houses.id WHERE students.id = $1"
    values = [@id]
    result = SqlRunner.run(sql, values)
    house = House.new(result.first)
    return house
  end
  def self.all()
    sql = "SELECT * FROM students"
    result = SqlRunner.run(sql)
    students = result.map {|student| Student.new(student)}
    return students
  end

  def self.delete_all()
    sql = " DELETE FROM students"
    SqlRunner.run(sql)
  end

  def self.find(id)
    sql = "SELECT * FROM students
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    student = Student.new(result[0])
    return student
  end

end
