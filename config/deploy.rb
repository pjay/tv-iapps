set :application, "gprc"
set :repository, "git://github.com/hip/tv-iapps.git"
set :scm, :git
set :branch, "origin/master"
set :deploy_via, :remote_cache

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
# set :deploy_to, "/var/www/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
# set :scm, :subversion

role :app, "iapps.v.easybox.ch"
role :web, "iapps.v.easybox.ch"
role :db,  "iapps.v.easybox.ch", :primary => true

set :user, "tv"
set :deploy_to, "/home/#{user}/rails"
set :group_writable, false

ssh_options[:port] = 6622
default_run_options[:pty] = true
