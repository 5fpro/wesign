OmniAuth.config.test_mode = true
OmniAuth.config.add_mock(:facebook)
OmniAuth.config.mock_auth[:facebook] = {
  "provider" => "facebook",
  "uid" => "21321312",
  "info" => {"email"=>"test@xxxx.com", "name"=>"Test"}
}