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
          alias_file = "#{Dir.pwd}/.nebula/console/aliases/nebula.yml"
          ssh_private_key = "#{Dir.pwd}/.vagrant/machines/default/virtualbox/private_key"

          # Write key file location into nebula.yml
          text = File.read(alias_file)
          new_contents = text.gsub(/(?<=private:.).*/, ssh_private_key)
          File.open(alias_file, "w") {|file| file.puts new_contents }

          # Symlink alias file
          FileUtils.ln_s alias_file, "#{Dir.home}/.console/sites/nebula.yml", force: true
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
