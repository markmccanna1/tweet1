get '/' do
  @display = "_front_page"
  erb :index
end

get '/:username' do 
  @twitteruser = TwitterUser.includes(:tweets).find_or_create_by_user_name(params[:username])
  erb :user
end


post '/username' do
  puts params[:user]
  redirect to "/#{params[:username]}"
end
