require 'spec_helper'

describe Deckbrew::MagicMetadata do

  describe "types" do
    let(:resp) { Deckbrew::MagicMetadata.types }

    it "returns all types" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "types"
    end
  end

  describe "subtypes" do
    let(:resp) { Deckbrew::MagicMetadata.subtypes }

    it "returns all subtypes" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "subtypes"
    end
  end

  describe "supertypes" do
    let(:resp) { Deckbrew::MagicMetadata.supertypes }

    it "returns all supertypes" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "supertypes"
    end
  end

  describe "colors" do
    let(:resp) { Deckbrew::MagicMetadata.colors }

    it "returns all colors" do
      expect(resp[:body]).to be_a Array
      expect(resp[:body]).to include "colors"
    end
  end
end
