require 'pry'
module Deckbrew
  module Tools
    class UrlQueryGenerator
      def initialize(queries)
        @queries = queries
      end

      def to_s
        queries.keys.map do |query|
          return "" if queries[query].nil?
          "#{query}=#{queries[query]}&"
        end.join
        binding.pry
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
