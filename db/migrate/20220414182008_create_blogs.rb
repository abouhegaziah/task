class CreateBlogs < ActiveRecord::Migration[7.0]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :body
      t.string :comment
      t.string :tag

      t.timestamps
    end
  end
end
