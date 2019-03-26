require_relative('../db/sql_runner')

class Category
  attr_reader :id
  attr_accessor :name
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = 'INSERT INTO categories (name)
    VALUES ($1)
    RETURNING id'
    values = [@name]
    id = SqlRunner.run(sql, values).first['id']
    @id = id
  end

  def update()
    sql = 'UPDATE categories SET name = $1
    WHERE id = $2'
    values = [@name, @id]
    SqlRunner.run(sql, values)
  end

  def self.map_categories(categories_data)
    return categories_data.map { |data| Category.new(data) }
  end

  def self.find(id)
    sql = 'SELECT * FROM categories
    WHERE id = $1'
    values = [id]
    found_category = SqlRunner.run(sql, values).first
    result = Category.new(found_category)

  end

  def self.all()
    sql = 'SELECT * FROM categories'
    categories_data = SqlRunner.run(sql)
    result = map_categories(categories_data)
    return result
  end

  def delete()
    sql = 'DELETE FROM categories
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM categories'
    SqlRunner.run(sql)
  end

end
