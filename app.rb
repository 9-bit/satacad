require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'koala'


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

get '/secrets' do
  @graph = Koala::Facebook::API.new('BAACEdEose0cBADOq0awqoutUQxATDWPijOXiiLNrHxdxwnb4WjyqElfJMQMGUpDfZC4OAU7gysECjZBp644cizUnYrfBW4Sv3gOlZBNMFVKRyowuxeWy07qnxBtZC2IFLQ2pzlF8629QAgRUTK0HTDVFGoyeIqKw3HPTzjKZBC7qvUEB3ZC7YR9YcL1NiM4rbY8szYd4F8JW1h2PQ3fSQFQZBgU3TPxhZBYzFSNUhA8OWAZDZD')
  @picture = @graph.get_picture('jpozelc')
  erb :secret
end


get '/name' do
  @name = (params[:name] || "Nobody").downcase
  if @name == "collin"
    redirect 'http://www.youtube.com/watch?v=oHg5SJYRHA0'
  else
    erb :name
  end
end
