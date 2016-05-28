module Infrastructure
  class ProfileForm < Form
    attribute :name, String
    attribute :description, String
    attribute :welcome_button1, String
    attribute :welcome_button2, String
    attribute :welcome_button3, String
    attribute :market_ids, Array[Integer], nullify_blank: true

    attr_accessor :profile, :persisted

    validates :name, presence: true

    def self.build_edit(profile, attributes = {})
      result = new
      result.persisted = true
      result.profile = profile
      result.attributes = {
        name: profile.name,
        description: profile.description,
        welcome_button1: profile.welcome_button1.name,
        welcome_button2: profile.welcome_button2.name,
        welcome_button3: profile.welcome_button3.name,
        market_ids: profile.market_ids
      }
      result.attributes = attributes if attributes.present?
      result
    end

    def market_ids=(values)
      super(values.reject(&:blank?))
    end

    def build_profile
      result = Domain::Profile.new(
        name: name,
        description: description,
        welcome_button1: welcome_button_value(welcome_button1),
        welcome_button2: welcome_button_value(welcome_button2),
        welcome_button3: welcome_button_value(welcome_button3)
      )
      result.market_ids = market_ids
      result
    end

    def update_profile
      @profile.name = name
      @profile.description = description
      @profile.welcome_button1 = welcome_button_value(welcome_button1)
      @profile.welcome_button2 = welcome_button_value(welcome_button2)
      @profile.welcome_button3 = welcome_button_value(welcome_button3)
      @profile.market_ids = market_ids
    end

  protected

    def model
      @profile
    end

    def model_class
      Domain::Profile
    end

  private

    def welcome_button_value(welcome_button_key)
      Domain::Profile::WelcomeButton.find_by_key(welcome_button_key.to_sym)
    end
  end
end
