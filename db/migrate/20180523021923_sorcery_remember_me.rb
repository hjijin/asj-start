class SorceryRememberMe < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :remember_me_token, :string, :default => nil
    add_column :staffs, :remember_me_token_expires_at, :datetime, :default => nil

    add_index :staffs, :remember_me_token
  end
end
