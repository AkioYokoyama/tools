# frozen_string_literal: true

# class OpenBrowser
class OpenBrowser
  require 'yaml'

  def execute
    raise ArgumentError if ARGV.empty?

    keyword = ARGV[0]
    sites = YAML.safe_load(File.open("#{__dir__}/urls.yml"))
    @url = sites[keyword]

    raise NoMatchingPatternError if @url.nil?

    system "open #{@url}"
  rescue ArgumentError => e
    puts "wrong number of arguments (given #{ARGV.count}, expected 1) (#{e})"
  rescue NoMatchingPatternError => e
    puts "#{keyword} does not exist in the list (#{e})"
  end
end

open_browser = OpenBrowser.new
open_browser.execute
