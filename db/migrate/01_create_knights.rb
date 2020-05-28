class CreateKnights < ActiveRecord::Migration[5.2]
  def change
    create_table :knights do |t|
      t.string :name
      t.string :weapon
      t.string :color
    end
  end
end
