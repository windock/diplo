class PrimaryConcern < ActiveRecord::Base
  validates :name, presence: true

  has_many :products, dependent: :nullify
end
