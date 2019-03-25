require('sinatra')
require('sinatra/contrib/all')
# require_relative('../models/product')
require_relative('../models/category')
also_reload('../models/*')

get '/category' do #INDEX
  @categories = Category.all()
  erb :'categories/index'
end
#
# get '/manufacturer/new' do #NEW
#   @manufacturers = Manufacturer.all()
#   erb :'manufacturers/new'
# end
#
# get '/manufacturer/:id' do #SHOW
#   @manufacturer = Manufacturer.find(params[:id])
#   erb :'manufacturers/show'
# end
#
# post '/manufacturer' do #CREATE
#   manufacturer = Manufacturer.new(params)
#   manufacturer.save()
#   redirect('/manufacturer')
# end
#
# get '/manufacturer/:id/edit' do #EDIT
#   @manufacturer = Manufacturer.find(params[:id])
#   erb :'manufacturers/edit'
# end
#
# patch '/manufacturer/:id' do #UPDATE
#   @manufacturer = Manufacturer.find(params[:id])
#   @manufacturer = Manufacturer.new(params)
#   @manufacturer.update()
#   redirect to "/manufacturer/#{@manufacturer.id}"
# end
#
# delete '/manufacturer/:id/delete' do #DELETE
#   @manufacturer = Manufacturer.find(params[:id])
#   @manufacturer.delete()
#   redirect('/manufacturer')
# end
