
begin
  require 'capistrano_colors'
rescue LoadError
  puts "`gem install capistrano_colors` to get output more userfriendly."
end

 
set :rvm_type, :system
require "rvm/capistrano"


require 'capistrano/ext/multistage'
set :stages,        %w(production staging)
set :default_stage, "staging"

require 'bundler/capistrano'

set :whenever_command, "bundle exec whenever"
require 'whenever/capistrano'

set :application, "compaign-tw"
set :repository,  "git@github.com:5fpro/wesign.git"
set :scm, :git

# set :deploy_via, :remote_cache
set :git_shallow_clone, 1

set :scm_verbose, true
set :use_sudo, false
set :symlink_paths, ['config/database.yml', 'config/setting.yml', 'public/uploads']


# from https://github.com/AF83/capistrano-af83/blob/master/lib/capistrano/af83/deploy/assets.rb
# set :assets_dependencies, %w(app/assets lib/assets vendor/assets Gemfile.lock config/routes.rb)


namespace :deploy do

  desc "Restart passenger process"
  task :restart, :roles => [:web], :except => { :no_release => true } do

    run "touch #{current_path}/tmp/restart.txt"

  end

  task :symlink_files, :roles => [:web] do
    symlink_paths.each do |path|
      run "ln -sf #{shared_path}/#{path} #{release_path}/#{path}"
    end
  end

end

namespace :remote_rake do
  desc "Run a task on remote servers, ex: cap staging remote_rake:invoke task=cache:clear"
  task :invoke do
    run "cd #{deploy_to}/current; RAILS_ENV=#{rails_env} bundle exec rake #{ENV['task']}"
  end
end

# cap staging tail_log
task :tail_log, :roles => :app do
  run "tail -f -n 100 #{shared_path}/log/#{rails_env}.log"
end


after "deploy:finalize_update", "deploy:symlink_files"
after "deploy", "deploy:cleanup"

require 'hipchat/capistrano'
set :hipchat_token, "67e8030352b96ac963ff7b5e13657c"
set :hipchat_room_name, "連署平台"
set :hipchat_announce, true
set :hipchat_color, 'purple'
set :hipchat_success_color, 'green'
set :hipchat_failed_color, 'red'
set :hipchat_message_format, 'text'


set :sidekiq_cmd, "bundle exec sidekiq"
set :sidekiqctl_cmd, "bundle exec sidekiqctl"

require 'sidekiq/capistrano'
