require 'sinatra'
require 'sinatra/reloader'




get '/' do
  erb :index   
end

get '/login' do
  @username = params [:username]
  @password = params [:password]
  if @username == 'jpoz'
    if @password == 'taco'
      "well done sir, Welcome"
    else
      "Come on dude, what's the right password?"
    end
  else
    "You are not JPOZ"
  end
end

get '/name' do
  @name = (params[:name] || "Nobody").downcase
  if @name == "collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end
