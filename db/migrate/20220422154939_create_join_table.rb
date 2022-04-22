class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.references :menu, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
