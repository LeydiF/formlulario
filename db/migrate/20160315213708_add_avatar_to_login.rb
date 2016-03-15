class AddAvatarToLogin < ActiveRecord::Migration
  def change
    add_column :logins, :avatar, :string
  end
end
