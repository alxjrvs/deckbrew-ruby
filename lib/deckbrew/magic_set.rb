module Deckbrew
  class MagicSet

    def self.all
      Config.api.get_all_sets
    end

    def self.find(id)
      Config.api.get_set(id)
    end
  end
end
