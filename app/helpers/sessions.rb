helpers do

  def current_user
    if !session[:id].nil?
      User.find(session[:id])
    else
      false
    end
  end
end
