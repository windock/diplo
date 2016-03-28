class RenamePrimaryConcern < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :primary_concern, :primary_concern_id
  end
end
