class Product < ActiveRecord::Base
  enum skin_type: [ :dry, :normal, :oily, :combination, :sensitive ]
  enum concern: [ :daily_care, :blemish, :cleanse, :daily_sun_care, :de_aging,
                  :deodorant, :dullness, :eye_area, :foundation, :hydration,
                  :moisturize, :pores, :redness, :shave, :sun_protection,
                  :tone, :unknown ]

  validates :name, :title, :concern_id, :skin_type, :sku, presence: true
end
