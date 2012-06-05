class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.integer :total_cost
      t.string :nodes
      t.string :start_word
      t.string :end_word
      t.boolean :completed
      t.integer :count

      t.timestamps
    end
  end
end
