module Deckbrew
  class MagicMetadata
    def self.types
      Conifg.api.get_types
    end

    def self.supertypes
      Conifg.api.get_supertypes
    end

    def self.subtypes
      Conifg.api.get_subtypes
    end

    def self.colors
      Conifg.api.get_colors
    end
  end
end

