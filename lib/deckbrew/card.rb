module Deckbrew
  class Card
    def self.all
      Config.api.get_all_cards
    end

    def self.find(id)
      Config.api.get_card(id)
    end

    # type  []string  Any valid card type. Possible values include enchantment and
    # subtype []string  Any valid card subtype. Possible values include zombie and tribal.
    # supertype []string  Any valid card supertype, such as legendary
    # name  []string  A fuzzy match on a card's name
    # oracle  []string  A fuzzy match on a card's Oracle rules text
    # set []string  A three letter identifier for a Magic set
    # rarity  []string  Select cards printed at this rarity. Options are common, uncommon, rare and mythic
    # color []string  Select cards of the chosen color
    # multicolor  bool  Only show cards that are multicolored. Legal values are true and false
    # multiverseid  []string  Select cards of that have at least one edition with the given Multiverse ID
    # m []string  Shortcut for Multiverse ID
    # format  []string  Only show cards allowed in a specific format. Legal values are vintage, legacy, modern, standard, and commander
    # status  []string  Only show cards with the given status. Legal values are legal, banned or restricted

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
      binding.pry
      Config.api.get_cards_filter(
         

      )
    end
  end
end
