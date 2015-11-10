module Deckbrew
  class Config
    @@api = DeckbrewApi
    cattr_accessor :api
  end
end

