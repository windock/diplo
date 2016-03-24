class CreateProfileMarkets < ActiveRecord::Migration[5.0]
  def change
    create_table :profile_markets do |t|
      t.references :profile, foreign_key: true
      t.references :market, foreign_key: true
    end
  end
end
