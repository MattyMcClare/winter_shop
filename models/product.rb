require_relative('../db/sql_runner')
require_relative('./manufacturer')
require_relative('./category')

class Product
  attr_reader :id
  attr_accessor :name, :description, :stock_quantity, :buying_cost, :selling_price, :manufacturer_id, :category_id, :min_stock_level
  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @description = options['description']
    @stock_quantity = options['stock_quantity'].to_i
    @buying_cost = options['buying_cost'].to_i
    @selling_price = options['selling_price'].to_i
    @manufacturer_id = options['manufacturer_id'].to_i
    @category_id = options['category_id'].to_i
    @min_stock_level = options['min_stock_level'].to_i
  end

  def markup
    return 0 if @buying_cost <= 0
    markup = (@selling_price.to_f - @buying_cost.to_f) / @buying_cost.to_f * 100
    markup_round = markup.round(2)
    return markup_round
  end

  def self.calculate_markup_all(manufacturer_id, category_id)
    buying_sum = filter_products(manufacturer_id, category_id).reduce(0) do |sum, product|
      sum += product.buying_cost
    end
    selling_sum = filter_products(manufacturer_id, category_id).reduce(0) do |sum, product|
      sum += product.selling_price
    end
    return 0 if buying_sum <= 0
    markup = (selling_sum.to_f - buying_sum.to_f) / buying_sum.to_f * 100
    markup_round = markup.round(2)
    return markup_round
  end

  def self.filter_sort_products(manufacturer_id, category_id, sort)
      if sort == "checked"
        products_arr = filter_products(manufacturer_id, category_id)
        return sort(products_arr)
      else
        filter_products(manufacturer_id, category_id)
      end
  end

  def self.sort(arr)
    result = arr.sort_by{ |product| product.stock_quantity }
  end

  def self.filter_products(manufacturer_id, category_id)
    return find_by_category(category_id) if manufacturer_id.zero?
    return find_by_manufacturer(manufacturer_id) if category_id.zero?
    return find_by_manufacturer_category(manufacturer_id, category_id)
  end

  def self.find_by_manufacturer_category(manufacturer_id, category_id)
    sql = 'SELECT * FROM products
    WHERE manufacturer_id = $1 AND category_id = $2'
    values = [manufacturer_id, category_id]
    all_by_man_cat = SqlRunner.run(sql, values)
    result = map_products(all_by_man_cat)
    return result
  end

  # def self.out_of_stock
  #   sql = 'SELECT * FROM products
  #   WHERE stock_quantity = 0'
  #   out_of_stock = SqlRunner.run(sql)
  #   result = map_products(out_of_stock)
  #   return result
  # end

  def self.find_by_category(category_id)
    return all if category_id.zero?

    sql = 'SELECT * FROM products
    WHERE category_id = $1'
    values = [category_id]
    all_by_category = SqlRunner.run(sql, values)
    result = map_products(all_by_category)
    return result
  end

  def self.find_by_manufacturer(manufacturer_id)
    return all if manufacturer_id.zero?

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

  def category
    sql = 'SELECT * FROM categories
    WHERE id = $1'
    values = [@category_id]
    result = SqlRunner.run(sql, values).first
    return Category.new(result)
  end

  def save()
    sql = 'INSERT INTO products (
    name,
    description,
    stock_quantity,
    buying_cost,
    selling_price,
    manufacturer_id,
    category_id,
    min_stock_level)
    VALUES
    ($1, $2, $3, $4, $5, $6, $7, $8)
    RETURNING id'
    values = [
      @name,
      @description,
      @stock_quantity,
      @buying_cost,
      @selling_price,
      @manufacturer_id,
      @category_id,
      @min_stock_level]
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
    category_id,
    min_stock_level
    ) =
    ($1, $2, $3, $4, $5, $6, $7, $8)
    WHERE id = $9'
    values = [
      @name,
      @description,
      @stock_quantity,
      @buying_cost,
      @selling_price,
      @manufacturer_id,
      @category_id,
      @min_stock_level,
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
