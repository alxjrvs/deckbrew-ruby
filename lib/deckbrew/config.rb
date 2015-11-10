module Deckbrew
  class Config
    @@api = Deckbrew::API::DeckbrewAPI
    def self.api
      @@api
    end

    def self.api=(new_api)
      @@api = new_api
    end
  end
end

