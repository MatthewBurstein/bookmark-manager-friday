require 'sinatra/base'
require 'sinatra/flash'
require './lib/link'
require './database_connection_setup'

class BookmarkManager < Sinatra::Base

  enable :sessions
  register Sinatra::Flash

  get '/' do
    @links = Link.all
    erb :index
  end

  post '/add_link' do
    link, title = params[:new_link], params[:title]
    p 'title is empty' if params[:title] = ''
    flash[:invalid_uri] = 'URI not valid' unless Link.add_new_link(link, title)
    @links = Link.all
    redirect to '/'
  end

  post '/delete' do
    Link.delete(params[:delete])
    redirect to '/'
  end

  get '/update' do
    @link = Link.find(params[:id])
    erb :update
  end

  post '/update_link' do
    Link.update(params)
    redirect to '/'
  end

  run! if app_file == $0
end
