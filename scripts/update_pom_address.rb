# frozen_string_literal: true

pom_file_path      = File.expand_path('pom.xml')
pom_file_data      = File.open(pom_file_path).read

pom_new_data = if ARGV.first.to_s.strip.eql?('localhost')
                 puts 'Setting localhost'
                 pom_file_data.gsub(/(192\.168\.\d+\.\d+)/, 'localhost')
               else
                 sleep 1
                 puts 'Please enter the X values for the target IP of pom.xml'
                 puts '192.168.X.X'
                 user_input  = gets.strip
                 new_address = ['192.168.', user_input].join

                 #  puts "Is this value correct #{new_address} (y/n)"
                 pom_file_data.gsub(/192\.168\.(\d+\.\d+)/, new_address)
               end

puts 'Writing changes to pom.xml file'

File.write(pom_file_path, pom_new_data)
