set :branch, 'develop'
set :user, 'apps'
set :domain, 'fight4.us'
set :rails_env, "staging"

server "#{domain}", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/wesign"