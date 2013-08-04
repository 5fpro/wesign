Rails.application.config.middleware.use OmniAuth::Builder do
  Setting.providers.each do |provider_name|
    options = Setting.send("#{provider_name}_auth_options") rescue {}
    provider(provider_name, Setting.send("#{provider_name}_token"), Setting.send("#{provider_name}_secret"), options)
  end
end

OmniAuth.config.path_prefix = '/users/auth'