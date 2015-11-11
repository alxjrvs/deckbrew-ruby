require 'spec_helper'


describe Deckbrew::Tools::UrlQueryGenerator do
  describe "#to_s" do
    it "turns all non-nil keys to parameters" do
      queries = { include: "four", second: "Not Nil!"}
      generator = Deckbrew::Tools::UrlQueryGenerator.new queries
      expect(generator.to_s).to include "include"
      expect(generator.to_s).to include "second"
    end
    it "turns all nil keys to empty strings" do
      queries = { include: nil, second: nil }
      generator = Deckbrew::Tools::UrlQueryGenerator.new queries
      expect(generator.to_s).to_not include "include"
      expect(generator.to_s).to_not include "second"

    end
    describe "multi-value options" do
      it "accepts single entries" do
        Deckbrew::Tools::UrlQueryGenerator::MULTI_QUERYABLE.each do |multi|
          queries = { multi => "red" }
          generator = Deckbrew::Tools::UrlQueryGenerator.new queries
          expected_string = "#{multi}=red&"
          expect(generator.to_s).to eq expected_string
        end
      end

      it "turns keys with multiple values into individual keys" do
        Deckbrew::Tools::UrlQueryGenerator::MULTI_QUERYABLE.each do |multi|
          queries = { multi => ["red", "blue"] }
          generator = Deckbrew::Tools::UrlQueryGenerator.new queries
          expected_string = "#{multi}=red&#{multi}=blue&"
          expect(generator.to_s).to eq expected_string
        end
      end
    end
  end
end
