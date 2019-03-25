require('sinatra')
require('sinatra/contrib/all')
set :views, Proc.new { File.join(root, "../views") }
require_relative('../models/product')
require_relative('../models/manufacturer')
also_reload('../models/*')

get '/product' do #INDEX
  @products = Product.all()
  erb :'products/index'
end

get '/product/new' do #NEW
  @manufacturers = Manufacturer.all()
  erb :'products/new'
end

get '/product/:id' do #SHOW
  @product = Product.find(params[:id])
  erb :'products/show'
end

post '/product' do #CREATE
  product = Product.new(params)
  product.save()
  redirect('/product')
end

get '/product/:id/edit' do #EDIT
  @product = Product.find(params[:id])
  @manufacturers = Manufacturer.all()
  erb :'products/edit'
end

patch '/product/:id' do #UPDATE
  @product = Product.find(params[:id])
  @product = Product.new(params)
  @product.update()
  redirect to "/product/#{@product.id}"
end

delete '/product/:id/delete' do #DELETE
  @product = Product.find(params[:id])
  @product.delete()
  redirect('/product')
end
