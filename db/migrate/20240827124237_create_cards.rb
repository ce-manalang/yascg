class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.references :game, null: false, foreign_key: true
      t.integer :level
      t.string :label
      t.boolean :wildcard, default: false
      t.boolean :reminder, default: false
      t.text :content

      t.timestamps
    end
  end
end