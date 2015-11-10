require 'httparty'

module Deckbrew
  module API
    class DeckbrewAPI
      include HTTParty
      base_uri 'https://api.deckbrew.com'

      CARDS = '/mtg/cards'
      SETS = '/mtg/sets'
      TYPES = '/mtg/types'
      SUPERTYPES = '/mtg/supertypes'
      SUBTYPES = '/mtg/subtypes'
      COLORS = '/mtg/colors'

      def self.get_all_cards
        get CARDS
      end

      def self.get_card(id)
        get "#{CARDS}/#{id}"
      end

      def self.get_cards_filter(queries)
        url = Deckbrew::Tools::UrlQueryGenerator.new(queries)
        binding.pry
        get "#{CARDS}?#{url.to_s}"
      end

      def self.get_all_sets
        get SETS
      end

      def self.get_set(id)
        get "#{SETS}/#{id}"
      end

      def self.get_types
        get TYPES
      end

      def self.get_supertypes
        get SUPERTYPES
      end

      def self.get_subtypes
        get SUBTYPES
      end

      def self.get_colors
        get COLORS
      end
    end
  end
end
