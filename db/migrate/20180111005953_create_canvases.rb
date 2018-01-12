class CreateCanvases < ActiveRecord::Migration[5.1]
  def change
    create_table :canvases do |t|
      t.string :name
      t.string :img
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
