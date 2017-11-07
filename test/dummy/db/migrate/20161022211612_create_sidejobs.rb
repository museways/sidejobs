class CreateSidejobs < ActiveRecord::Migration[5.1]
  def change
    create_table :sidejobs do |t|
      t.jsonb :data
      t.string :queue
      t.string :state, default: 'pending'
      t.integer :priority, default: 0
      t.integer :attempts, default: 0
      t.text :error
      t.datetime :processed_at
      t.datetime :scheduled_at

      t.timestamps null: false
    end

    add_index :sidejobs, :state
    add_index :sidejobs, :scheduled_at
    add_index :sidejobs, :attempts
    add_index :sidejobs, :priority
  end
end
