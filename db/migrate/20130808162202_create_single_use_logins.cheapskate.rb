# This migration comes from cheapskate (originally 20130808161902)
class CreateSingleUseLogins < ActiveRecord::Migration
  def change
    create_table :single_use_logins do |t|
      t.integer :user_id
      t.string  :token
    end

    add_index :single_use_logins, :token
  end
end
