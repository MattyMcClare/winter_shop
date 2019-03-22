require('../db/sql_runner.rb')

class Manufacturer
  attr_reader :id
  attr_accessor :name, :contact, :address
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @contact = options['contact']
    @address = options['address']
  end
  def save()
    sql = 'INSERT INTO manufacturers(
    name, contact, address)
    VALUES ($1, $2, $3)
    RETURNING id'
    values = [@name, @contact, @address]
    id = SqlRunner.run(sql, values).first['id']
    @id = id
  end

  def map_manufacturers(manufacturers_data)
    return manufacturers_data.map { |data| Manufacturer.new(data) }
  end

  def self.all()
    sql = 'SELECT * FROM manufacturers'
    manufacturers_data = SqlRunner.run(sql)
    result = map_manufacturers(manufacturers_data)
    return result
  end

  def self.delete_all()
    sql = 'DELETE FROM manufacturers'
    SqlRunner.run(sql)
  end
end
