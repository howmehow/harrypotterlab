require_relative("../db/sqlrunner")
class House
attr_reader :id
attr_accessor :name, :logo
  def initialize(options)
    @id = options["id"].to_i() if options["id"]
    @name = options["name"]
    @logo = options["logo"]
  end
  def save()
    sql = "INSERT INTO houses (
    name, logo
    ) VALUES ($1,$2)
    RETURNING id"
    values = [@name, @logo]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i()
  end
  def self.delete_all()
    sql = "DELETE FROM houses"
    SqlRunner.run(sql)
  end
  def self.all()
    sql = "SELECT * FROM houses"
    result = SqlRunner.run(sql)
    houses = result.map {|house| House.new(house)}
    return houses
  end
  def self.find(id)
    sql = "SELECT * FROM houses
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    house = House.new(result[0])
    return house
  end


end
