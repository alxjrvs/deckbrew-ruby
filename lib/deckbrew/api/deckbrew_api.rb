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
        resp = get CARDS
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_card(id)
        resp = get "#{CARDS}/#{id}"
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_cards_filter(queries)
        url = Deckbrew::Tools::UrlQueryGenerator.new(queries)
        resp = get "#{CARDS}?#{url.to_s}"
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_all_sets
        resp = get SETS
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_set(id)
        resp = get "#{SETS}/#{id}"
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_types
        resp = get TYPES
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_supertypes
        resp = get SUPERTYPES
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_subtypes
        resp = get SUBTYPES
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end

      def self.get_colors
        resp = get COLORS
        return { 
          body: resp.parsed_response,
          raw: resp
        }
      end
    end
  end
end
