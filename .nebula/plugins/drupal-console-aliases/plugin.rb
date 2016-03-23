module VagrantPlugins
  module DrupalConsoleAliases
    class Plugin < Vagrant.plugin('2')
      name 'drupal console aliases'
      description <<-DESC
      Adds and removes a drupal console site alias file.
      DESC

      ['up', 'resume', 'reload'].each do |action|
        action_hook(:add_site_alias_file, "machine_action_#{action}") do |hook|
          hook.append(Action::AddSiteAliasFile)
        end
      end

      ['destroy', 'suspend', 'halt'].each do |action|
        action_hook(:remove_site_alias_file, "machine_action_#{action}") do |hook|
          hook.append(Action::RemoveSiteAliasFile)
        end
      end
    end

    module Action
      require 'fileutils'
      class AddSiteAliasFile
        def initialize(app, env)
          @app = app
        end

        def call(env)
          puts 'Adding site alias file...'
          FileUtils.ln_s "#{Dir.pwd}/.nebula/console/nebula.yml", "#{Dir.home}/.console/sites/nebula.yml", force: true
          @app.call(env)
        end
      end

      class RemoveSiteAliasFile
        def initialize(app, env)
          @app = app
        end

        def call(env)
          if File.symlink?("#{Dir.home}/.console/sites/nebula.yml")
            puts 'Removing site alias file...'
            FileUtils.rm "#{Dir.home}/.console/sites/nebula.yml"
            @app.call(env)
          end
        end
      end
    end
  end
end
