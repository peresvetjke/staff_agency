class AddCandidates < ActiveRecord::Migration[6.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :surname
      t.string :middle_name
      t.integer :desired_salary
      t.integer :status
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
