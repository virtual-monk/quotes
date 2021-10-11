module RonSwanson
  module V2
    class Client
      include HTTParty
      base_uri "https://ron-swanson-quotes.herokuapp.com/v2/quotes"

      def initialize
      end

      def get_quote
        self.class.get("/")
      end
    end
  end
end