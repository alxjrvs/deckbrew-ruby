require 'pry'
module Deckbrew
  module Tools
    class UrlQueryGenerator

      MULTI_QUERYABLE = [
        :color,
        :type,
        :subtype,
        :supertype,
        :rarity,
        :format,
        :status

      ]
      def initialize(queries)
        @queries = queries
      end

      def to_s
        queries.keys.map do |query|
          data = queries[query]
          if data.nil?
            ''
          elsif query_multiple?(query)
            digest key: query
          else
            format_string(query, data)
          end
        end.join
      end

      private
      attr_reader :queries

      def format_string(query, val)
        "#{query}=#{val}&"
      end

      def query_multiple?(query)
        queries[query].kind_of?(Array) &&
        MULTI_QUERYABLE.include?(query)
      end

      def digest(key:)
        values = queries[key]
        values.map do |val|
          format_string key, val
        end.join
      end
    end
  end
end
