class AddFieldsToPosts < ActiveRecord::Migration[7.1]
  def change
    add_column :posts, :version, :integer
    add_column :posts, :version_created_at, :datetime
  end
end
