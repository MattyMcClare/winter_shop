require('sinatra')
require('sinatra/contrib/all')
set :views, Proc.new { File.join(root, "../views") }
require_relative('./product_controller')
# Default file paths
# set :root, File.dirname(__FILE__)
# set :public_folder, settings.root + “public”
# set :views, settings.root + “views”

  get '/' do
    erb :index
  end
