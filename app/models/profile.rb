class Profile < ApplicationRecord
  class WelcomeButton < TypeIs::Enum
    new :None, 'None'
    new :Campaign, 'Campaign'
    new :MenCatalogue, 'Men Catalogue'
    new :WomenCatalogue, 'Women Catalogue'
    new :MenSkinDiagnostics, 'Men Skin Diagnostics'
    new :WomenSkinDiagnostics, 'Women Skin Diagnostics'

    def to_s
      key
    end
  end

  validates :name, :language_id, presence: true

  attribute :welcome_button1, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: Profile::WelcomeButton::None
  attribute :welcome_button2, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: Profile::WelcomeButton::None
  attribute :welcome_button3, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: Profile::WelcomeButton::None
end
