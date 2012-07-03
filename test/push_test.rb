require File.dirname(__FILE__) + '/test_helper'

class PushTest < Test::Unit::TestCase
  
  def test_invalid_nezumi_url
    ENV['NEZUMI_URL'] = nil
    
    assert_raises Nezumi::URLNotSetError do
      Nezumi::Push.notification "foo"
    end
  end
  
  def test_blank_message
    assert_raises Nezumi::BlankMessageError do
      Nezumi::Push.notification ""
    end
  end
  
  def test_nil_message
    assert_raises Nezumi::BlankMessageError do
      Nezumi::Push.notification nil
    end
  end
  
  def test_send_message_with_default_options
    message = "new user signup"
    
    stub_request_with_params({ "message" => message, "sound" => "default", "push" => "true" })
    
    Nezumi::Push.notification(message)
  end
  
  def test_send_message_and_options
    message = "new user signup"
    push    = "false"
    sound   = "cha-ching"
    
    stub_request_with_params({ "message" => message, "sound" => sound, "push" => push })
    
    Nezumi::Push.notification(message, { :push => push, :sound => sound })
  end
  
  def stub_request_with_params(params)
    stub_request(:post, ENV['NEZUMI_URL']).
      with(:body => params).
      to_return(:status => 200, :body => "", :headers => {})
  end

  
end