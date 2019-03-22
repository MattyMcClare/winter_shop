require_relative('../models/product')
require_relative('../models/manufacturer')

Product.delete_all()
Manufacturer.delete_all()

manufacturer_salomon = Manufacturer.new({
  'name' => 'Salomon',
  'contact' => '+442035100639',
  'address' => '8 S Gyle Cres Ln Edinburgh, EH129EG'
  })
manufacturer_salomon.save()

product_salomon1 = Product.new({
  'name' => 'Salomon Ultimate Ride Hybrid Camber Snowboard',
  'description' => 'Size 153cm Colour Black/blue,  Black Deck, Blue/Black Base Year 2019',
  'stock_quantity' => 5,
  'buying_cost' => 300,
  'selling_price' => 500,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => 1
  })

product_salomon2 = Product.new({
  'name' => 'Salomon Pulse Hybrid Camber Snowboard',
  'description' => 'Size 145cm Colour Black/red, Gray Deck, Red/Black Base Year 2019',
  'stock_quantity' => 7,
  'buying_cost' => 200,
  'selling_price' => 300,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => 1
  })

product_salomon3 = Product.new({
  'name' => 'Salomon Driver Ski/Snowboard Visor Helmet',
  'description' => 'S - Small 53cm-56cm Colour Black Brand Colour All Black - Matte Black Gender Adult Unisex Lens Solar Blue - Tonic Orange spare lens',
  'stock_quantity' => 11,
  'buying_cost' => 120,
  'selling_price' => 200,
  'manufacturer_id' => manufacturer_salomon.id,
  'category_id' => 2
  })

product_salomon1.save()
product_salomon2.save()
product_salomon3.save()

product_salomon2.name = 'Nike'
product_salomon2.update()
