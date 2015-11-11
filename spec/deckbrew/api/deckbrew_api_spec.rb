require 'spec_helper'

describe Deckbrew::API::DeckbrewAPI do
  describe "get_all_cards" do
    before { VCR.insert_cassette 'get_all_cards', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_all_cards }

    it "gets all cards and parses bodies" do
      expect(resp[:body]).to_not be_nil
      resp[:body].each do |card|
        expect(card["name"]).to_not be_nil
      end
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_card" do
    before { VCR.insert_cassette 'get_card', record: :none } 
    after { VCR.eject_cassette }
    let(:id) { 'demonic-tutor' }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_card(id) }

    it "gets card with the given id" do
      expect(resp[:body]).to_not be_nil
      expect(resp[:body]["id"]).to eq id
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_card_filter" do
    before { VCR.insert_cassette 'get_card_filter', record: :none } 
    after { VCR.eject_cassette }
    let(:queries) { { color: ["red", "blue"], set: "UNH", type: "sorcery"} }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_cards_filter(queries) }

    it "gets cards that match the criteria"  do
      expect(resp[:body]).to_not be_nil
      resp[:body].each do |card|
        colors = card["colors"]
        if colors.include? "red"
          expect(colors).to include "red"
        else
          expect(colors).to include "blue"
        end
        sets = card["editions"].map { |set| set["set_id"] }
        expect(sets).to include "UNH"
        expect(card["types"]).to include "sorcery"
      end
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_all_sets" do
    before { VCR.insert_cassette 'get_all_sets', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_all_sets }

    it "gets all cards and parses bodies" do
      expect(resp[:body]).to_not be_nil
      resp[:body].each do |set|
        expect(set["name"]).to_not be_nil
      end
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_set" do
    before { VCR.insert_cassette 'get_set', record: :none } 
    after { VCR.eject_cassette }
    let(:id)  { "UNH" }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_set(id) }

    it "returns the details of a single set" do
      expect(resp[:body]["id"]).to eq id
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_types" do
    before { VCR.insert_cassette 'get_types', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_types }

    it "returns a list of all types" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "instant"
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_supertypes" do
    before { VCR.insert_cassette 'get_supertypes', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_supertypes }

    it "returns a list of all supertypes" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "snow"
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_subtypes" do
    before { VCR.insert_cassette 'get_subtypes', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_subtypes }

    it "returns a list of all subtypes" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "wizard"
      expect(resp[:raw]).to_not be_nil
    end
  end

  describe "get_colors" do
    before { VCR.insert_cassette 'get_colors', record: :none } 
    after { VCR.eject_cassette }
    let(:resp) { Deckbrew::API::DeckbrewAPI.get_colors }

    it "returns a list of all colors" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "red"
      expect(resp[:raw]).to_not be_nil
    end
  end
end
