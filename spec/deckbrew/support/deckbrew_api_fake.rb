module Support
  class DeckbrewApiFake
    SET_DATA = {
      "id"=>"CHK", 
      "name"=>"Champions of Kamigawa", 
      "border"=>"black", 
      "type"=>"expansion", 
      "url"=>"https://api.deckbrew.com/mtg/sets/CHK", 
      "cards_url"=>"https://api.deckbrew.com/mtg/cards?set=CHK"
    }

    CARD_DATA = {
      "name"=>"_____", 
      "id"=>"_____", 
      "url"=>"https://api.deckbrew.com/mtg/cards/_____",
      "store_url"=>"http://store.tcgplayer.com/magic/unhinged/_____?partner=DECKBREW", 
      "types"=>["creature"], 
      "subtypes"=>["shapeshifter"], 
      "colors"=>["blue"], 
      "cmc"=>2, 
      "cost"=>"{1}{U}", 
      "text"=>"{1}: This card's name becomes the name of your choice. Play this ability anywhere, anytime.", 
      "power"=>"1", 
      "toughness"=>"1", 
      "formats"=>{}, 
      "editions"=>[
        {
          "set"=>"Unhinged", 
          "set_id"=>"UNH", 
          "rarity"=>"uncommon", 
          "artist"=>"Ron Spears", 
          "multiverse_id"=>74252, 
          "flavor"=>"{1}: This card's flavor text becomes the flavor text of your choice. (This ability doesn't work because it's flavor text, not rules text (but neither does this reminder text, so you figure it out).)", 
          "number"=>"23", 
          "layout"=>"normal", 
          "price"=>{
            "low"=>0, 
            "median"=>0, 
            "high"=>0
          }, 
          "url"=>"https://api.deckbrew.com/mtg/cards?multiverseid=74252", 
          "image_url"=>"https://image.deckbrew.com/mtg/multiverseid/74252.jpg", 
          "set_url"=>"https://api.deckbrew.com/mtg/sets/UNH", 
          "store_url"=>"http://store.tcgplayer.com/magic/unhinged/_____?partner=DECKBREW"
        }
      ]
    }

    def self.get_all_cards
      {
        body: [CARD_DATA],
        raw: {}
      }
    end

    def self.get_card(id)
      {
        body: CARD_DATA,
        raw: {}
      }
    end

    def self.get_cards_filter(queries)
      stringified = {}
      queries.each do |k, v|
        stringified[k.to_s] = v
      end

      {
        body: [stringified],
        raw: {}
      }
    end

    def self.get_all_sets
      {
        body: [SET_DATA],
        raw: {}
      }
    end

    def self.get_set(id)
      {
        body: SET_DATA,
        raw: {}
      }
    end

    def self.get_types
      {
        body: ["types"],
        raw: {}
      }
    end

    def self.get_supertypes
      {
        body: ["supertypes"],
        raw: {}
      }
    end

    def self.get_subtypes
      {
        body: ["subtypes"],
        raw: {}
      }
    end

    def self.get_colors
      {
        body: ["colors"],
        raw: {}
      }
    end
  end
end
