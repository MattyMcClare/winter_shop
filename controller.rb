require('sinatra')
require('sinatra/contrib/all')
require_relative('models/product')
require_relative('models/manufacturer')
also_reload('./models/*')

get '/' do
  redirect('/winter-shop')
end

get '/winter-shop' do #INDEX
  @products = Product.all()
  erb :index
end

get '/winter-shop/new' do #NEW
  erb :new
end

get '/winter-shop/:id' do #SHOW
  @product = Product.find(params[:id])
  erb :product
end

post '/winter-shop' do #CREATE
  product = Product.new(params)
  product.save()
  redirect('/winter-shop')
end

get '/winter-shop/:id/edit' do #EDIT
  @product = Product.find(params[:id])
  erb :edit
end

patch '/winter-shop/:id' do #UPDATE
  @product = Product.find(params[:id])
  @product = Product.new(params)
  @product.update()
  # redirect('/winter-shop')
  redirect to "/winter-shop/#{@product.id}"
end

delete '/winter-shop/:id/delete' do #DELETE
  @product = Product.find(params[:id])
  @product.delete()
  redirect('/winter-shop')
end
