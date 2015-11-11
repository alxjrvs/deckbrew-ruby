module Deckbrew
  class Card
    def self.all
      Config.api.get_all_cards
    end

    def self.find(id)
      Config.api.get_card(id)
    end

    def self.where(
      types: nil, 
      subtypes: nil, 
      supertypes: nil, 
      name: nil, 
      oracle: nil, 
      sets: nil, 
      rarity: nil, 
      colors: nil, 
      multicolor: nil, 
      multiverseid: nil, 
      formats: nil, 
      status: nil, 
      m: nil
    )
      queries = {
        type: types, 
        subtype: subtypes, 
        supertype: supertypes, 
        name: name, 
        oracle: oracle, 
        set: sets, 
        rarity: rarity, 
        color: colors, 
        multicolor: multicolor, 
        multiverseid: multiverseid, 
        format: formats, 
        status: status, 
        m: m
      }
      Config.api.get_cards_filter queries
    end
  end
end
