class AddConcerns < ActiveRecord::Migration[5.0]
  def change
    create_table :primary_concerns do |t|
      t.string :name
      t.text :description
    end
  end
end
