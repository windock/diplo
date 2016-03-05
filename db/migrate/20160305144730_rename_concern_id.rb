class RenameConcernId < ActiveRecord::Migration
  def change
    rename_column :products, :concern_id, :primary_concern
  end
end
