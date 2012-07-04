module Nezumi
  class Push

    def self.notify(message, opts = {})
      url   = ENV['NEZUMI_URL']
      sound = opts.fetch(:sound, "default")
      push  = opts.fetch(:push, true)

      raise URLNotSetError.new if url.nil? || url.empty?
      raise ArgumentError.new("Message must not be blank") if message.nil? || message.empty?

      RestClient.post(url, { :message => message, :sound => sound, :push => !!push })
    end

  end
end
