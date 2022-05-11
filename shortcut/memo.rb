# frozen_string_literal: true

file_name = ARGV[0].nil? ? 'memo' : ARGV[0]
extension = ARGV[1].nil? ? 'md' : ARGV[1]
path = "#{Dir.home}/Desktop/#{file_name}.#{extension}"

File.new(path, 'a')
system("open #{path}")
