class CreateAchieves < ActiveRecord::Migration[6.0]
  def change
    create_table :achieves do |t|
      t.date       :success_day, null: false
      t.text       :comment
      t.references :dream,       null: false, foreign_key: true
      t.references :user,        null: false, foreign_key: true

      t.timestamps
    end
  end
end
