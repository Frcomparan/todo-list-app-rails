class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.string :description
      t.date :due_date
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.integer :priority

      t.timestamps
    end
  end
end
