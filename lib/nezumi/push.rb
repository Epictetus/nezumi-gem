module Nezumi
  class Push

    def self.notification(message, opts = {})
      raise URLNotSetError.new if ENV['NEZUMI_URL'].nil? || ENV['NEZUMI_URL'].empty?
      raise BlankMessageError.new if message.nil? || message.empty?

      sound = opts[:sound]  || "default"
      push  = (opts[:push].nil? ? true : opts[:push])

      RestClient.post(ENV['NEZUMI_URL'], { :message => message, :sound => sound, :push => push })
    end

  end
end
