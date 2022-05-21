# frozen_string_literal: true

# Make Empty File
class Memo
  def initialize
    @file_name = ARGV[0].nil? ? 'memo' : ARGV[0]
    @extension = ARGV[1].nil? ? 'md' : ARGV[1]
  end

  def create
    File.new(path, 'a')
  end

  def open
    system("open #{path}")
  end

  private

  def path
    "#{Dir.home}/Desktop/#{@file_name}.#{@extension}"
  end
end

memo = Memo.new
memo.create
memo.open
