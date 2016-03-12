class RemoveLanguageFromProfile < ActiveRecord::Migration
  def change
    remove_column :profiles, :language_id
  end
end
