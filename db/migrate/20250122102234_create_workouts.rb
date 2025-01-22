class CreateWorkouts < ActiveRecord::Migration[8.0]
  def change
    create_table :workouts do |t|
      t.integer :membership_id
      t.integer :trainer_id
      t.date :date
      t.integer :duration

      t.timestamps
    end
  end
end
