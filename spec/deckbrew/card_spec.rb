require 'spec_helper'

describe Deckbrew::Card do

  describe "all" do
    let(:resp) { Deckbrew::Card.all }

    it "returns all cards" do
      expect(resp[:body]).to be_a Array
      resp[:body].each do |card|
        expect(card["name"]).to_not be_nil
      end
    end

  end

  describe "find" do
    let(:id) { "_____" }
    let(:resp) { Deckbrew::Card.find(id) }
    it "returns a card based on id" do
      expect(resp[:body]).to be_a Hash
      expect(resp[:body]["id"]).to eq id
    end
  end

  describe "where" do
    let(:resp) { Deckbrew::Card.where(colors: ["red", "blue"]) }

    it "returns a scoped card" do
      expect(resp[:body]).to be_a Array
      resp[:body].each do |card|
        colors = card["color"]
        if colors.include? "red"
          expect(colors).to include "red"
        else
          expect(colors).to include "blue"
        end
      end
    end
  end
end
