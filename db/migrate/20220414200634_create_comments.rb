class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :blog, null: false, foreign_key: true

      t.timestamps
    end
    add_index :comments, :blog_id
  end
end
