require_relative('../models/product')
require_relative('../models/manufacturer')
require_relative('../models/category')

Category.delete_all()
Manufacturer.delete_all()
Product.delete_all()


manufacturer_salomon = Manufacturer.new({
  'name' => 'Salomon',
  'contact' => '+442035100639',
  'address' => '8 S Gyle Cres Ln Edinburgh, EH129EG'
  })

manufacturer_atomic = Manufacturer.new({
  'name' => 'Atomic',
  'contact' => '+442035100656',
  'address' => 'AMER SPORTS UK LTD Theta Building, Lyon Way Frimley, GU16 7ER, Surrey'
  })

manufacturer_rossignol = Manufacturer.new({
  'name' => 'Rossignol',
  'contact' => '+441316192812',
  'address' => '15 Dunivaig Rd, Glasgow G33 4TT'
  })

manufacturer_salomon.save()
manufacturer_atomic.save()
manufacturer_rossignol.save()

category_snowboards = Category.new({
  'name' => 'Snowboards'
  })

category_skis = Category.new({
  'name' => 'Skis'
  })

category_helmets = Category.new({
  'name' => 'Helmets'
  })

category_snowboards.save()
category_skis.save()
category_helmets.save()

product_salomon1 = Product.new({
  'name' => 'Salomon Ultimate Ride Hybrid Camber Snowboard',
  'description' => 'Size 153cm Colour Black/blue,  Black Deck, Blue/Black Base Year 2019',
  'stock_quantity' => 5,
  'buying_cost' => 300,
  'selling_price' => 500,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => category_snowboards.id,
  'min_stock_level' => 2
  })

product_salomon2 = Product.new({
  'name' => 'Salomon Pulse Hybrid Camber Snowboard',
  'description' => 'Size 145cm Colour Black/red, Gray Deck, Red/Black Base Year 2019',
  'stock_quantity' => 7,
  'buying_cost' => 200,
  'selling_price' => 300,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => category_snowboards.id,
  'min_stock_level' => 4
  })

product_salomon3 = Product.new({
  'name' => 'Salomon Driver Ski/Snowboard Visor Helmet',
  'description' => 'S - Small 53cm-56cm Colour Black Brand Colour All Black - Matte Black Gender Adult Unisex Lens Solar Blue - Tonic Orange spare lens',
  'stock_quantity' => 11,
  'buying_cost' => 120,
  'selling_price' => 200,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => category_helmets.id,
  'min_stock_level' => 3
  })

product_atomic1 = Product.new({
  'name' => 'Atomic Downhill Ski Redster G7 Bindings X12',
  'description' => 'Size 155cm Colour Gray/red, Black Deck, Red/Black Base Year 2019',
  'stock_quantity' => 2,
  'buying_cost' => 400,
  'selling_price' => 650,
  'manufacturer_id' => manufacturer_atomic.id,
  'category_id' => category_skis.id,
  'min_stock_level' => 3
  })

product_atomic2 = Product.new({
  'name' => 'Atomic Redster S9 + X12 TLR 18/19',
  'description' => 'Size 160cm Colour Red, Black Deck, Red/Black Base Year 2018',
  'stock_quantity' => 0,
  'buying_cost' => 400,
  'selling_price' => 650,
  'manufacturer_id' => manufacturer_atomic.id,
  'category_id' => category_skis.id,
  'min_stock_level' => 3
  })

product_rossignol1 = Product.new({
  'name' => 'Rossignol Hero Fis Gs Pro + Spx B73 Race',
  'description' => 'Size 170cm Colour Black/yellow, Black Deck, Yellow/Black Base Year 2019',
  'stock_quantity' => 12,
  'buying_cost' => 450,
  'selling_price' => 550,
  'manufacturer_id' => manufacturer_rossignol.id,
  'category_id' => category_skis.id,
  'min_stock_level' => 7
  })

product_salomon1.save()
product_salomon2.save()
product_salomon3.save()
product_atomic1.save()
product_atomic2.save()
product_rossignol1.save()

# p Product.calculate_markup

# category_skis.name = 'Nike'
# category_skis.update()

# manufacturer_atomic.delete()
