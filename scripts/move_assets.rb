# frozen_string_literal: true

require 'fileutils'

project_root = File.expand_path('.')
update_files = case ARGV.first.to_s.strip
               when /base/
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

puts 'Updating Jenkinsfile'

update_files.each do |file|
  FileUtils.cp(file, project_root)
end
