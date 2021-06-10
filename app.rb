require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'
require 'open-uri'
require 'sinatra/json'

enable :sessions

get '/' do
    erb :index
end

get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

post '/signin' do
    user = User.find_by(mail: params[:mail])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
    end
    redirect '/'
end

post '/signup' do
    @user = User.create(user_name:params[:user_name],mail:params[:mail],password:params[:password],
    password_confirmation:params[:password_confirmation])
    if @user.persisted?
        session[:user]= @user.id
    end
    redirect '/index'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

get "/user_memos/:id" do
    @memos = User.find(params[:id]).memos.all
    erb :user
end

get '/memo' do
    @memos = Memo.all.order('id desc')
    erb :memo
end



post '/delete/memo/:id' do
    Memo.find(params[:id]).destroy
    redirect '/memo'
end

get '/edit/memo/:id' do
	@memo = Memo.find(params[:id])
    erb :edit
end

post '/renew/memo/:id' do
    memo = Memo.find(params[:id])
    memo.update({
        name: params[:name],
        body: params[:body]
    })
    redirect '/memo'
end

get '/new/memo' do
    erb :new
end

post '/new/memo/:id' do
    Memo.create({
        name: params[:name],
        body: params[:body]
    })
    redirect '/memo'
end

get '/index' do
    erb :index
end

get '/mandalart' do
    erb :mandalart
end

get '/workspace' do
    erb :workspace
end

post '/workspace' do
end

get '/workspace/:id' do
	erb :workspace_edit
end

post '/workspace/:id' do
	
end




