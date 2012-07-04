module Nezumi

  class URLNotSetError < StandardError
    def initialize(msg = nil)
      super("NEZUMI_URL must be set")
    end
  end

end
