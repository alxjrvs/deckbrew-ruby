require 'pry'
module Deckbrew
  module Tools
    class UrlQueryGenerator
      def initialize(queries)
        @queries = queries
      end

      def to_s
        queries.keys.map do |query|
          if queries[query].nil?
            ''
          elsif query == "color"
            digest_color(queries[query])
          else
            "#{query}=#{queries[query]}&"
          end
        end.join
      end

      private
      attr_reader :queries

      def digest_color(colors)
        colors.map do |color|
          "color=#{color}&"
        end.join
      end
    end
  end
end
