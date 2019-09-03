class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :question, foreign_key: true
      t.integer :answer_id
      t.text :content

      t.timestamps
    end
  end
end
