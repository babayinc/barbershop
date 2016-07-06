#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

@@masters = {
			'Walter_White' => "Walter White", 
			'Jesie_Pinkman' => "Jesie Pinkman", 
			'Gus_Fring' => "Gus Fring"}

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified"
end

get '/about' do
	@error = "Something"
	erb :about
end

get '/visit' do
	erb :visit
end

get '/contacts' do
	erb :contacts
end

post '/visit' do
	@user_name = params[:user_name]
	@phone = params[:phone]
	@date_time = params[:date_time]
	@master = params[:optionsRadios]
	@master2 = params[:master_select]
	@color = params[:color]

	errorsh = {
		:user_name => 'Enter name',
		:phone => 'Enter phone',
		:date_time => 'Enter date and time'
		}

	errorsh.each do |key, value|
		if params[key] == ''
			@error = value
			return erb :visit
		end
	end



	file_obj = File.new("./public/users.txt", "a")
	file_obj.puts "#{@user_name};#{@phone};#{@date_time};#{@@masters[@master]}; #{@master2}"
	file_obj.close
	erb "#{@user_name};#{@phone};#{@date_time};#{@@masters[@master]}; #{@master2}; #{@color}"
end

post '/contacts' do
	@users_email = params[:users_email]
	@email_text = params[:email_text]
	file_obj = File.new("./public/contacts.txt", "a")
	file_obj.puts "#{@users_email}:#{@email_text}"
	file_obj.close
 end

