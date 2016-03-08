class Profile < ActiveRecord::Base
  class WelcomeButton < TypesafeEnum::Base
    new :NONE, 'None'
    new :CAMPAIGN, 'Campaign'
    new :MEN_CATALOGUE, 'Men Catalogue'
    new :WOMEN_CATALOGUE, 'Women Catalogue'
    new :MEN_SKIN_DIAGNOSTICS, 'Men Skin Diagnostics'
    new :WOMEN_SKIN_DIAGNOSTICS, 'Women Skin Diagnostics'

    def to_s
      value
    end

    def self.load(button_ord)
      return NONE if button_ord.nil?
      self.find_by_ord(button_ord)
    end

    def self.dump(button)
      button.ord
    end
  end

  validates :name, :language_id, presence: true

  serialize :welcome_button1, WelcomeButton
  serialize :welcome_button2, WelcomeButton
  serialize :welcome_button3, WelcomeButton

  def welcome_button1=(value)
    value = value.to_i if value.is_a?(String)
    super(value)
  end

  def welcome_button2=(value)
    value = value.to_i if value.is_a?(String)
    super(value)
  end

  def welcome_button3=(value)
    value = value.to_i if value.is_a?(String)
    super(value)
  end
end
