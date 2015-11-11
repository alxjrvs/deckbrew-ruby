require 'spec_helper'

describe Deckbrew::MagicSet do

  describe "all" do
    let(:resp) { Deckbrew::MagicSet.all }

    it "returns all sets" do
      expect(resp[:body]).to be_a Array
      resp[:body].each do |card|
        expect(card["name"]).to_not be_nil
      end
    end

  end

  describe "find" do
    let(:id) { "CHK" }
    let(:resp) { Deckbrew::MagicSet.find(id) }
    it "returns a card based on id" do
      expect(resp[:body]).to be_a Hash
      expect(resp[:body]["id"]).to eq id
    end
  end
end
