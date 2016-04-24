class Profile < ApplicationRecord
  include HasMarkets

  class WelcomeButton < TypeIs::Enum
    new :None, 'None'
    new :Campaign, 'Campaign'
    new :MenCatalogue, 'Men Catalogue'
    new :WomenCatalogue, 'Women Catalogue'
    new :MenSkinDiagnostics, 'Men Skin Diagnostics'
    new :WomenSkinDiagnostics, 'Women Skin Diagnostics'
  end

  validates :name, presence: true

  attribute :welcome_button1, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: WelcomeButton::None
  attribute :welcome_button2, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: WelcomeButton::None
  attribute :welcome_button3, TypeIs::IndexEnumAttribute.new(WelcomeButton), default: WelcomeButton::None

  has_many :profile_markets

  def can_be_destroyed?
    Device.where(profile: self).blank?
  end

protected

  def market_association
    profile_markets
  end
end
