class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.integer :question_id, :null => false
      t.string  :option,      :null => false

      # Computed calculations
      t.integer :answers_count

      t.timestamps
    end

    add_index :options, :question_id
  end
end
