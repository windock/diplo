class Profile < ApplicationRecord
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
  end

  validates :name, :language_id, presence: true

  attribute :welcome_button1, StrictEnum::IndexEnum.new(WelcomeButton)
  attribute :welcome_button2, StrictEnum::IndexEnum.new(WelcomeButton)
  attribute :welcome_button3, StrictEnum::IndexEnum.new(WelcomeButton)
end
