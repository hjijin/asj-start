class SorceryResetPassword < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :reset_password_token, :string, :default => nil
    add_column :staffs, :reset_password_token_expires_at, :datetime, :default => nil
    add_column :staffs, :reset_password_email_sent_at, :datetime, :default => nil

    add_index :staffs, :reset_password_token
  end
end
