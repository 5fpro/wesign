module RequestClient

  def signout
    delete '/users/sign_out'
    @current_user = nil if response.status == 302
  end

  def signin_user(user = nil)
    user ||= FactoryGirl.create(:user)
    data = { email: user.email, password: user.password }
    post '/users/sign_in', :user => data
    @current_user = user if response.status == 302
  end

  def current_user
    @current_user
  end

end