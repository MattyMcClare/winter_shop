require('sinatra')
require('sinatra/contrib/all')
require_relative('./controllers/product_controller')
require_relative('./controllers/manufacturer_controller')

  get '/' do
    erb :index
  end
