# winter_shop
Winter Shop Solo Project

ver 0.0.1
-added class Product
-added class Manufacturer
-added class Category
-created winter_shop db
-added products table to winter_shop db
-added manufacturers table to winter_shop db
-created seed file
-created sql_runner
-added CRUD for Product class
-added CRUD for Manufacturer class

ver 0.0.2
-fixed bug for map_manufacturers method
-added methods find, update and delete for Manufacturer class
-added Atomic manufacturer in seed file

ver 0.0.3
-added layout.erb page with basic html
-added products.erb page
-new get route /winter_shop in controller

ver 0.0.4
-changed products.erb to index.erb
-added for loop in index.erb
-created new.erb and form
-added create, new and show route
-added list with home and add product in layout page

ver 0.0.5
-added update and delete route
-created edit.erb with form
-changed winter_shop routes to winter-shop (fix)

ver 0.0.6
-refactored folder Controler
-refactored products routes
-added app.rb

ver 0.0.7
-added index, show, edit, update and delete routes
-app.rb moved to main folder

ver 0.1.0
-added low stock and out of stock highlighter

ver 0.1.1
-created new table for category
-added new seed for categories
-added CRUD for category class
-created index file for category
-added index route for category

ver 0.1.2
-added create, update and delete routes for category
-added filter by manufacturer

ver 0.1.3
-added filter by category
-added dropdown for category in prduct edit

ver 0.1.4
-refactored filter by manufacturer and category
-added selected feature for filter by manufacturer and category

ver 0.1.5
-added calculating markup and markup_all

ver 0.1.6
-added min value for new and edit product
-added markup into show product

ver 0.1.7
-added sorting by stock level

ver 0.2.0
-added total income
-added income per product

ver 0.2.1
-refactored product show to table
-added nav bar
-styled home page
