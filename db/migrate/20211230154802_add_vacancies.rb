class AddVacancies < ActiveRecord::Migration[6.0]
  def change
    create_table :vacancies do |t|
      t.string :title
      t.date :expiration_date
      t.integer :salary
      t.string :phone_number
      t.string :email

      t.timestamps
    end
  end
end
