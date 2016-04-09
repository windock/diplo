class DropMoreTimestamps < ActiveRecord::Migration[5.0]
  def change
    remove_timestamps :markets
  end
end
