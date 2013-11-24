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

  def create_user_by_omniauth
    init_omniauth_env
    get "/users/auth/facebook/callback", nil, @request_env
  end

  def signin_user_by_omniauth
    create_user_by_omniauth
    authorization = Authorization.find_by_uid omniauth_env['uid']
    @current_user = authorization.auth
  end

  def init_omniauth_env
    @request_env = { "omniauth.auth" => OmniAuth.config.mock_auth[:facebook] }
  end

  def omniauth_env
    @request_env["omniauth.auth"]
  end
  
end