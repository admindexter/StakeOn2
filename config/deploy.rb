# Necessary to run on Site5
set :use_sudo, false
set :group_writable, false

# Less releases, less space wasted
set :keep_releases, 2

# The mandatory stuff
set :application, "stakeon2"
set :user, "stakeon2"
set :password, "independence"

# GIT information
default_run_options[:pty] = true
set :repository, "git@github.com:admindexter/StakeOn2.git"

set :scm, "git"
set :branch, "master"
set :deploy_via, :remote_cache



# This is related to site5 too.
set :deploy_to, "/home/stakeon2/apps/stakeon2"

role :app, "stakeon2.com"
role :web, "stakeon2.com"
role :db, "stakeon2.com", :primary => true


# In the deploy namespace we override some default tasks and we define
# the site5 namespace.
namespace :deploy do
  desc <<-DESC
Deploys and starts a `cold' application. This is useful if you have not \
deployed your application before, or if your application is (for some \
other reason) not currently running. It will deploy the code, run any \
pending migrations, and then instead of invoking `deploy:restart', it will \
invoke `deploy:start' to fire up the application servers.
DESC
  # NOTE: we kill public_html so be sure to have a backup or be ok with this application
  # being the default app for the domain.
  task :cold do
    update
    site5::link_public_html
    site5::kill_dispatch_fcgi
  end

  desc <<-DESC
Site5 version of restart task.
DESC
  task :restart do
    site5::kill_dispatch_fcgi
  end

  set :ssh_options, {:forward_agent => true}
  on :start do
    `ssh-add`
  end

  namespace :site5 do
    desc <<-DESC
Links public_html to current_release/public
DESC
    task :link_public_html do
      run "cd /home/stakeon2; rm -rf public_html; ln -s /home/stakeon2/apps/stakeon2/current/public/ public_html"
    end

    desc <<-DESC
Kills Ruby instances on Site5
DESC
    task :kill_dispatch_fcgi do
      run "skill -u stakeon2 -c ruby"
    end

    desc "Ensure files and folders have correct permissions on site5"
    task :fix_permissions do
      run "find /home/stakeon2/apps/stakeon2/current/public/ -type d -exec chmod 0755 {} \\;"
      run "find /home/stakeon2/apps/stakeon2/current/public/ -type f -exec chmod 0644 {} \\;"
      run "chmod 0755 /home/stakeon2/apps/stakeon2/current/public/dispatch.*"
      run "chmod -R 0755 /home/stakeon2/apps/stakeon2/current/script/*"
    end

    task :after_deploy do
      deploy::site5::fix_permissions
    end

  end
end

