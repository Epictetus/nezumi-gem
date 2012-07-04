module Nezumi
  class Push

    def self.notification(message, opts = {})
      url   = ENV['NEZUMI_URL']
      sound = opts.fetch(:sound, "default")
      push  = opts.fetch(:push, true)

      raise URLNotSetError.new if url.nil? || url.empty?
      raise BlankMessageError.new if message.nil? || message.empty?

      RestClient.post(url, { :message => message, :sound => sound, :push => !!push })
    end

  end
end
