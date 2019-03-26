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
  Category.new(params).save()
  redirect('/category')
end

get '/category/:id/edit' do #EDIT
  @category = Category.find(params[:id])
  erb :'categories/edit'
end

patch '/category/:id' do #UPDATE
  Category.new(params).update()
  redirect "/category"
end

delete '/category/:id/delete' do #DELETE
  Category.find(params[:id]).delete()
  redirect('/category')
end
