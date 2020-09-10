require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end
end
