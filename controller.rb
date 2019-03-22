require('sinatra')
require('sinatra/contrib/all')
require_relative('models/product')
require_relative('models/manufacturer')
also_reload('./models/*')

get '/' do
  redirect('/winter_shop')
end

get '/winter_shop' do
  @products = Product.all()
  erb(:products)
end
