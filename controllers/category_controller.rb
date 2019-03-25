require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/category')
also_reload('../models/*')

get '/category' do #INDEX
  @categories = Category.all()
  erb :'categories/index'
end

get '/category/new' do #NEW
  erb :'categories/new'
end

post '/category' do #CREATE
  category = Category.new(params)
  category.save()
  redirect('/category')
end

get '/category/:id/edit' do #EDIT
  @category = Category.find(params[:id])
  erb :'categories/edit'
end

patch '/category/:id' do #UPDATE
  @category = Category.find(params[:id])
  @category = Category.new(params)
  @category.update()
  redirect "/category"
end

delete '/category/:id/delete' do #DELETE
  @categories = Category.find(params[:id])
  @categories.delete()
  redirect('/category')
end
