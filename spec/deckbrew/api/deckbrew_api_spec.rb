require 'spec_helper'

describe Deckbrew::API::DeckbrewAPI do
  describe "get_all_cards" do
    before { VCR.insert_cassette 'get_all_cards', record: :new_episodes } 
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
end
