require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/product_controller')
require_relative('./controllers/manufacturer_controller')
require_relative('./controllers/category_controller')

  get '/' do
    erb :index
  end
