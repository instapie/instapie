class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,           :null => false
      t.string :name,            :null => false
      t.string :image_url
      t.string :password_digest, :null => false

      # Computed calculations
      t.integer :questions_count, :default => 0
      t.integer :answers_count,   :default => 0

      # It'll be useful/interesting to know when users joined
      t.timestamps
    end

    add_index :users, :email, :unique => true
  end
end
