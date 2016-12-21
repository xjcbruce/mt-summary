class CreateRateAssignments < ActiveRecord::Migration
  def change
    create_table :rate_assignments do |t|

      t.string :target_person_name, null: false
      t.string :rater_name, null: false
      t.string :rater_type, null: false
      t.string :url_code, null: false, index: true

      t.timestamps null: false
    end
  end
end
