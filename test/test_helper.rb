ENV['RACK_ENV'] = 'test'

require 'bundler/setup'
require 'test/unit'
require 'webmock/test_unit'

require File.dirname(__FILE__) + '/../lib/nezumi'

WebMock.disable_net_connect!

class Test::Unit::TestCase
  
  def setup
    ENV['NEZUMI_URL'] = "https://username:apikey@push.nezumiapp.com"
  end
  
end