class CreateLines < ActiveRecord::Migration[5.2]
  def change
    create_table :lines do |t|
      t.string :content
      t.string :author
      t.string :color
      t.references :corpse, foreign_key: true

      t.timestamps
    end
  end
end
