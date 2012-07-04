require File.dirname(__FILE__) + '/test_helper'

class PushTest < Test::Unit::TestCase

  def test_invalid_nezumi_url
    ENV['NEZUMI_URL'] = nil

    assert_raises Nezumi::URLNotSetError do
      Nezumi::Push.notify "foo"
    end
  end

  def test_blank_message
    assert_raises Nezumi::BlankMessageError do
      Nezumi::Push.notify ""
    end
  end

  def test_nil_message
    assert_raises Nezumi::BlankMessageError do
      Nezumi::Push.notify nil
    end
  end

  def test_send_message_with_default_options
    stub_request_with_params("message" => "new user signup", "sound" => "default", "push" => "true")
    Nezumi::Push.notify("new user signup")
  end

  def test_send_message_with_overriden_options
    stub_request_with_params("message" => "new paid plan", "sound" => "cha-ching", "push" => "false")
    Nezumi::Push.notify("new paid plan", { :push => false, :sound => "cha-ching" })
  end

  def test_send_message_with_truthy_push_option
    stub_request_with_params("message" => "error", "sound" => "default", "push" => "true")
    Nezumi::Push.notify("error", :push => "any object")
  end

  def test_send_message_with_falsey_push_option
    stub_request_with_params("message" => "queue filled", "sound" => "default", "push" => "false")
    Nezumi::Push.notify("queue filled", :push => nil)
  end

  def stub_request_with_params(params)
    stub_request(:post, ENV['NEZUMI_URL']).
      with(:body => params).
      to_return(:status => 200, :body => "", :headers => {})
  end


end
