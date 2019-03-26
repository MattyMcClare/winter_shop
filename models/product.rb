require_relative('../db/sql_runner')
require_relative('./manufacturer')
require_relative('./category')

class Product
  attr_reader :id
  attr_accessor :name, :description, :stock_quantity, :buying_cost, :selling_price, :manufacturer_id, :category_id
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @category_id = options['category_id'].to_i
  end

  def self.filter_products(manufacturer_id, category_id)
    if (manufacturer_id.nil? || manufacturer_id.empty?) &&
      (category_id.nil? || category_id.empty?)
      return all()
    elsif (manufacturer_id.nil? || manufacturer_id.empty?)
      find_by_category(category_id)
    elsif (category_id.nil? || category_id.empty?)
      find_by_manufacturer(manufacturer_id)
    else
      find_by_man_cat(manufacturer_id, category_id)
    end
  end

  def self.find_by_man_cat(manufacturer_id, category_id)
    sql = 'SELECT * FROM products
    WHERE manufacturer_id = $1 AND category_id = $2'
    values = [manufacturer_id, category_id]
    all_by_man_cat = SqlRunner.run(sql, values)
    result = map_products(all_by_man_cat)
    return result
  end

  def self.find_by_category(category_id)
    sql = 'SELECT * FROM products
    WHERE category_id = $1'
    values = [category_id]
    all_by_category = SqlRunner.run(sql, values)
    result = map_products(all_by_category)
    return result
  end

  # def self.out_of_stock
  #   sql = 'SELECT * FROM products
  #   WHERE stock_quantity = 0'
  #   out_of_stock = SqlRunner.run(sql)
  #   result = map_products(out_of_stock)
  #   return result
  # end

  def self.find_by_manufacturer(manufacturer_id)
    sql = 'SELECT * FROM products
    WHERE manufacturer_id = $1'
    values = [manufacturer_id]
    all_by_manufacturer = SqlRunner.run(sql, values)
    result = map_products(all_by_manufacturer)
    return result
  end

  def manufacturer
    sql = 'SELECT * FROM manufacturers
    WHERE id = $1'
    values = [@manufacturer_id]
    result = SqlRunner.run(sql, values).first
    return Manufacturer.new(result)
  end

  def save()
    sql = 'INSERT INTO products (
    name,
    description,
    stock_quantity,
    buying_cost,
    selling_price,
    manufacturer_id,
    category_id)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7)
    RETURNING id'
    values = [
      @name,
      @description,
      @stock_quantity,
      @buying_cost,
      @selling_price,
      @manufacturer_id,
      @category_id]
    id = SqlRunner.run(sql, values).first['id']
    @id = id
  end

  def self.map_products(products_data)
    return products_data.map { |data| Product.new(data) }
  end

  def self.all()
    sql = 'SELECT * FROM products'
    products_data = SqlRunner.run(sql)
    result = map_products(products_data)
    return result
  end

  def self.find(id)
    sql = 'SELECT * FROM products
    WHERE id = $1'
    values = [id]
    found_product = SqlRunner.run(sql, values).first
    result = Product.new(found_product)
    return result
  end

  def update()
    sql = 'UPDATE products SET (
    name,
    description,
    stock_quantity,
    buying_cost,
    selling_price,
    manufacturer_id,
    category_id
    ) =
    ($1, $2, $3, $4, $5, $6, $7)
    WHERE id = $8'
    values = [
      @name,
      @description,
      @stock_quantity,
      @buying_cost,
      @selling_price,
      @manufacturer_id,
      @category_id,
      @id]
      SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM products
    WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = 'DELETE FROM products'
    SqlRunner.run(sql)
  end

end
