# frozen_string_literal: true

# class OpenBrowser
class OpenBrowser
  require 'yaml'

  def initialize
    keyword = ARGV[0]
    sites = YAML.safe_load(File.open("#{__dir__}/urls.yml"))
    @url = sites[keyword]
  end

  def execute
    system "open #{@url}"
  end
end

open_browser = OpenBrowser.new
open_browser.execute
