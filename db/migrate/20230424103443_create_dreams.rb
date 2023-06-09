class CreateDreams < ActiveRecord::Migration[6.0]
  def change
    create_table :dreams do |t|
      t.string     :dream_list, null: false
      t.string     :cost
      t.string     :due
      t.text       :memo
      t.references :user       , null: false, foreign_key: true
      t.timestamps
    end
  end
end
