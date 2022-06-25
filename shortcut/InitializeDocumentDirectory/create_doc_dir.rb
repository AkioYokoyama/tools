# frozen_string_literal: true

require 'yaml'
require 'fileutils'

# Create Document Directory
class CreateDocDir
  DOCUMENT_PATH = "#{Dir.home}/Documents/"

  def initialize
    structure = open('structure.yml', 'r') { |yml| YAML.safe_load(yml) }

    structure['Directory'].map do |dir_path|
      FileUtils.mkdir_p("#{DOCUMENT_PATH}#{dir_path}")
      puts "#{DOCUMENT_PATH}#{dir_path} created."
    end

    structure['File'].map do |file_path|
      File.new("#{DOCUMENT_PATH}#{file_path}", 'a')
      puts "#{DOCUMENT_PATH}#{file_path} created."
    end
  end
end

CreateDocDir.new
