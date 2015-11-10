module Deckbrew
  class MagicMetadata
    def self.types
      Config.api.get_types
    end

    def self.supertypes
      Config.api.get_supertypes
    end

    def self.subtypes
      Config.api.get_subtypes
    end

    def self.colors
      Config.api.get_colors
    end
  end
end

