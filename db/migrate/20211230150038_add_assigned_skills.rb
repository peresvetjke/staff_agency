class AddAssignedSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :assigned_skills do |t|
      t.references :skillable, polymorphic: true
      t.references :skill

      t.timestamps
    end
  end
end
