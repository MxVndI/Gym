class CreateTrainers < ActiveRecord::Migration[8.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.string :specialty
      t.integer :experience
      t.string :phone
      t.string :email

      t.timestamps
    end
  end
end
