class CreateMemberships < ActiveRecord::Migration[8.0]
  def change
    create_table :memberships do |t|
      t.string :name
      t.string :phone
      t.date :start_date
      t.date :end_date
      t.string :status

      t.timestamps
    end
  end
end
