module Domain
  class Profile
    include Infrastructure::Entity

    class WelcomeButton < TypeIs::Enum
      new :None, 'None'
      new :Campaign, 'Campaign'
      new :MenCatalogue, 'Men Catalogue'
      new :WomenCatalogue, 'Women Catalogue'
      new :MenSkinDiagnostics, 'Men Skin Diagnostics'
      new :WomenSkinDiagnostics, 'Women Skin Diagnostics'
    end

    def initialize(id: nil, name: '',  description: '',
                   welcome_button1: WelcomeButton::None,
                   welcome_button2: WelcomeButton::None,
                   welcome_button3: WelcomeButton::None)
      self.id = id
      self.name = name
      self.description = description
      self.welcome_button1 = welcome_button1
      self.welcome_button2 = welcome_button2
      self.welcome_button3 = welcome_button3
      self.market_ids = []
    end

    attr_accessor :name, :description, :welcome_button1, :welcome_button2, :welcome_button3, :market_ids

    def can_be_destroyed?
      Registry.device_repository.for_profile_id(id).blank?
    end

    def market_ids=(values)
      @market_ids = values.map { |value| Integer(value) }
    end

    def markets=(markets)
      self.market_ids = markets.map(&:id)
    end

    def markets
      market_ids.map do |market_id|
        Registry.market_repository.find(market_id)
      end
    end
  end
end
