class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.integer :user_id,     :null => false
      t.string  :question,    :null => false
      t.text    :description

      # Computed calculations
      t.integer :answers_count, :default => 0

      t.timestamps
    end

    add_index :questions, :user_id
  end
end
