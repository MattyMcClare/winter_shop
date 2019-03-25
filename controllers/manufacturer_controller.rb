#
# get '/' do
#   redirect('/product')
# end
#
# get '/product' do #INDEX
#   @products = Product.all()
#   erb :products
# end
#
# get '/product/new' do #NEW
#   @manufacturers = Manufacturer.all()
#   erb :new
# end
#
# get '/product/:id' do #SHOW
#   @product = Product.find(params[:id])
#   erb :product
# end
#
# post '/product' do #CREATE
#   product = Product.new(params)
#   product.save()
#   redirect('/product')
# end
#
# get '/product/:id/edit' do #EDIT
#   @product = Product.find(params[:id])
#   @manufacturers = Manufacturer.all()
#   erb :edit
# end
#
# patch '/product/:id' do #UPDATE
#   @product = Product.find(params[:id])
#   @product = Product.new(params)
#   @product.update()
#   redirect to "/product/#{@product.id}"
# end
#
# delete '/product/:id/delete' do #DELETE
#   @product = Product.find(params[:id])
#   @product.delete()
#   redirect('/product')
# end
