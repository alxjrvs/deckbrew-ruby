module Deckbrew
  class Card
    def self.all
      Config.api.get_all_cards
    end

    def self.find(id)
      Config.api.get_card(id)
    end

    def self.where(
      type: nil, 
      subtype: nil, 
      supertype: nil, 
      name: nil, 
      oracle: nil, 
      set: nil, 
      rarity: nil, 
      color: nil, 
      multicolor: nil, 
      multiverseid: nil, 
      format: nil, 
      status: nil, 
      m: nil
    )
      queries = {
        type: type, 
        subtype: subtype, 
        supertype: supertype, 
        name: name, 
        oracle: oracle, 
        set: set, 
        rarity: rarity, 
        color: color, 
        multicolor: multicolor, 
        multiverseid: multiverseid, 
        format: format, 
        status: status, 
        m: m
      }
      Config.api.get_cards_filter queries
    end
  end
end
