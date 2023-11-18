require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'
require 'sinatra/activerecord'
require 'open-uri'
require 'sinatra/json'
require 'sinatra/flash'

enable :sessions

helpers do
	def current_user
		User.find_by(id: session[:user])
	end
end

get '/' do
  erb :index
end

get '/index' do
	erb :index
end

get '/signup' do
	erb :sign_up
end

get '/signin' do
	erb :sign_in
end

post '/signup' do
	User.create(
		mail: params[:mail],
		password: params[:password],
		password_confirmation: params[:password_confirmation]
	)
	redirect '/signin'
end

post '/signin' do
	user = User.find_by(mail: params[:mail])
	if user && user.authenticate(params[:password])
		session[:user] = user.id
	end
	redirect '/index'
end

get '/signout' do
    session[:user] = nil
    redirect '/index'
end

# メモ機能

get '/memo' do
    if current_user.nil?
    	@memos = Memo.none
    else
    	@memos = current_user.memos
    end	
    erb :'memos/index'
end

get "/user_memos/:id" do
    @memos = User.find(params[:id]).memos.all
    erb :'memos/index'
end

get '/new/memo' do
    erb :'memos/new'
end

post '/new/memo/:id' do
	current_user.memos.create({
    name: params[:name],
    body: params[:body],
    user_id: params[:id]
  })
  redirect '/memo'
end

post '/delete/memo/:id' do
    Memo.find(params[:id]).destroy
    redirect '/memo'
end

get '/edit/memo/:id' do
	@memo = Memo.find(params[:id])
    erb :'memos/edit'
end

post '/renew/memo/:id' do
    Memo.update({
        name: params[:name],
        body: params[:body]
    })
    redirect '/memo'
end

# マンダラート機能

get '/mandalarts' do
  if current_user
  	@mandalarts = current_user.mandalarts
  # 	binding.irb
    erb :'mandalarts/index'
  else
    flash[:alert] = 'セッションが切れました。もう一度ログインしてください'
    erb :'sign_in'
  end
end

get "/mandalarts/:id" do
    @mandalarts = User.find(params[:id]).mandalart.all
    erb :'mandalarts/index'
end

get "/new/mandalart" do
  erb :'mandalarts/new'
end

post '/new/mandalart' do
  Mandalart.create({
    name: params[:mandalart_title],
    user_id: current_user.id
  })
	Cell.create({
		body11: params[:body11],
		body12: params[:body12],
		body13: params[:body13],
		body14: params[:body14],
		body15: params[:body15],
		body16: params[:body16],
		body17: params[:body17],
		body18: params[:body18],
		body19: params[:body19],
		body21: params[:body21],
		body22: params[:body22],
		body23: params[:body23],
		body24: params[:body24],
		body25: params[:body25],
		body26: params[:body26],
		body27: params[:body27],
		body28: params[:body28],
		body29: params[:body29],
		body31: params[:body31],
		body32: params[:body32],
		body33: params[:body33],
		body34: params[:body34],
		body35: params[:body35],
		body36: params[:body36],
		body37: params[:body37],
		body38: params[:body38],
		body39: params[:body39],
		body41: params[:body41],
		body42: params[:body42],
		body43: params[:body43],
		body44: params[:body44],
		body45: params[:body45],
		body46: params[:body46],
		body47: params[:body47],
		body48: params[:body48],
		body49: params[:body49],
		body51: params[:body51],
		body52: params[:body52],
		body53: params[:body53],
		body54: params[:body54],
		body55: params[:body55],
		body56: params[:body56],
		body57: params[:body57],
		body58: params[:body58],
		body59: params[:body59],
		body61: params[:body61],
		body62: params[:body62],
		body63: params[:body63],
		body64: params[:body64],
		body65: params[:body65],
		body66: params[:body66],
		body67: params[:body67],
		body68: params[:body68],
		body69: params[:body69],
		body71: params[:body71],
		body72: params[:body72],
		body73: params[:body73],
		body74: params[:body74],
		body75: params[:body75],
		body76: params[:body76],
		body77: params[:body77],
		body78: params[:body78],
		body79: params[:body79],
		body81: params[:body81],
		body82: params[:body82],
		body83: params[:body83],
		body84: params[:body84],
		body85: params[:body85],
		body86: params[:body86],
		body87: params[:body87],
		body88: params[:body88],
		body89: params[:body89],
		body91: params[:body91],
		body92: params[:body92],
		body93: params[:body93],
		body94: params[:body94],
		body95: params[:body95],
		body96: params[:body96],
		body97: params[:body97],
		body98: params[:body98],
		body99: params[:body99],
		mandalart_id: current_user.mandalarts.ids[-1],
	})
	redirect '/mandalarts'
end

post '/delete/mandalart/:id' do 
	Mandalart.find(params[:id]).destroy
	Cell.find_by(mandalart_id: params[:id]).destroy
	redirect '/mandalarts'
end

get '/edit/mandalart/:id' do
  @mandalart = Mandalart.find(params[:id])
  @cell = Cell.find_by(mandalart_id: params[:id])
  erb :'mandalarts/edit'
end

post '/edit/mandalart/:id' do
  mandalart = Mandalart.find(params[:id])
  mandalart.update(name: params[:mandalart_title])
  cell = Cell.find_by(mandalart_id: params[:id])
  cell.update({
      body11: params[:body11],
  		body12: params[:body12],
  		body13: params[:body13],
  		body14: params[:body14],
  		body15: params[:body15],
  		body16: params[:body16],
  		body17: params[:body17],
  		body18: params[:body18],
  		body19: params[:body19],
  		body21: params[:body21],
  		body22: params[:body22],
  		body23: params[:body23],
  		body24: params[:body24],
  		body25: params[:body25],
  		body26: params[:body26],
  		body27: params[:body27],
  		body28: params[:body28],
  		body29: params[:body29],
  		body31: params[:body31],
  		body32: params[:body32],
  		body33: params[:body33],
  		body34: params[:body34],
  		body35: params[:body35],
  		body36: params[:body36],
  		body37: params[:body37],
  		body38: params[:body38],
  		body39: params[:body39],
  		body41: params[:body41],
  		body42: params[:body42],
  		body43: params[:body43],
  		body44: params[:body44],
  		body45: params[:body45],
  		body46: params[:body46],
  		body47: params[:body47],
  		body48: params[:body48],
  		body49: params[:body49],
  		body51: params[:body51],
  		body52: params[:body52],
  		body53: params[:body53],
  		body54: params[:body54],
  		body55: params[:body55],
  		body56: params[:body56],
  		body57: params[:body57],
  		body58: params[:body58],
  		body59: params[:body59],
  		body61: params[:body61],
  		body62: params[:body62],
  		body63: params[:body63],
  		body64: params[:body64],
  		body65: params[:body65],
  		body66: params[:body66],
  		body67: params[:body67],
  		body68: params[:body68],
  		body69: params[:body69],
  		body71: params[:body71],
  		body72: params[:body72],
  		body73: params[:body73],
  		body74: params[:body74],
  		body75: params[:body75],
  		body76: params[:body76],
  		body77: params[:body77],
  		body78: params[:body78],
  		body79: params[:body79],
  		body81: params[:body81],
  		body82: params[:body82],
  		body83: params[:body83],
  		body84: params[:body84],
  		body85: params[:body85],
  		body86: params[:body86],
  		body87: params[:body87],
  		body88: params[:body88],
  		body89: params[:body89],
  		body91: params[:body91],
  		body92: params[:body92],
  		body93: params[:body93],
  		body94: params[:body94],
  		body95: params[:body95],
  		body96: params[:body96],
  		body97: params[:body97],
  		body98: params[:body98],
  		body99: params[:body99],
  })
  redirect '/mandalarts'
end
