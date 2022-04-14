class AddUserToBlogs < ActiveRecord::Migration[7.0]
  def change
    add_column :blogs, :user, :string
  end
end
