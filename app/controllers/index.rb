get '/' do
  @all_users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  @user = User.find_by_email(params[:user][:email])
  if @user.password == params[:user][:password]
    session[:id] = @user.id
    redirect '/'
  else
    redirect '/'
  end
end

delete '/sessions/:id' do
  p params
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  @user = User.create(params[:user])
  session[:id] = @user.id
  redirect '/'
end
