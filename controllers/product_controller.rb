require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/product')
require_relative('../models/manufacturer')
require_relative('../models/category')
also_reload('../models/*')

get '/product' do #INDEX
  @manufacturers = Manufacturer.all()
  @categories = Category.all()
  manufacturer_id = params[:manufacturer_id].to_i
  category_id = params[:category_id].to_i
  @products = Product.filter_products(manufacturer_id, category_id)
  @markup_all = Product.calculate_markup_all(manufacturer_id, category_id)
  @manufacturer_id = manufacturer_id.to_i
  @category_id = category_id.to_i
  erb :'products/index'
end

get '/product/new' do #NEW
  @manufacturers = Manufacturer.all()
  @categories = Category.all()
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
  @categories = Category.all()
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
