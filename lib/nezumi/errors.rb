module Nezumi

  class URLNotSetError < StandardError
    def initialize(msg = nil)
      super("NEZUMI_URL must be set")
    end
  end

  class BlankMessageError < ArgumentError
    def initialize(msg = nil)
      super("Message must not be blank")
    end
  end

end
