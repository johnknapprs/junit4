# frozen_string_literal: true

require 'fileutils'

project_root     = File.expand_path('.')
jenkinsfile_path = File.join(project_root, 'Jenkinsfile')
settings_path    = File.join(project_root, 'settings.xml')

update_files = case ARGV.first.to_s.strip
               when /base/
                 [jenkinsfile_path, settings_path].each do |file|
                   if File.exist?(file)
                     puts "Removing #{file}"
                     FileUtils.rm_f(file)
                   end
                 end

                 Dir['scripts/demo_base/*'].map { |f| File.expand_path(f) }
               when /build/
                 Dir['scripts/demo_build/*'].map { |f| File.expand_path(f) }
               when /deploy/
                 Dir['scripts/demo_deploy/*'].map { |f| File.expand_path(f) }
               when /downstream/
                 Dir['scripts/demo_downstream/*'].map { |f| File.expand_path(f) }
               else
                 raise 'Unable to find matching configurations'
               end

puts 'Updating files'

update_files.each do |file|
  FileUtils.cp(file, project_root)
end
