require('sinatra')
require('sinatra/contrib/all')
require_relative('models/product')
require_relative('models/manufacturer')
also_reload('./models/*')

get '/' do
  redirect('/winter_shop')
end

get '/winter_shop' do #INDEX
  @products = Product.all()
  erb(:index)
end

get '/winter_shop/new' do #NEW
  erb(:new)
end

get '/winter_shop/:id' do #SHOW
  @product = Product.find(params[:id])
  erb(:product)
end

post '/winter_shop' do #CREATE
  product = Product.new(params)
  product.save()
  redirect('/winter_shop')
end
