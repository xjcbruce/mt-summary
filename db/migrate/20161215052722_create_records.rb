class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|

      t.integer :target_person_id, null: false
      t.integer :rater_id, null: false
      t.string :rater_type, null: false

      t.timestamps null: false
    end

    create_table :record_details do |t|

      t.references :record, null: false
      t.string :subject_type, null: false
      t.integer :subject_answer_no, null: false, default: 0
      t.string :question_type, null: false
      t.integer :point_option, null: false, default: 0

      t.timestamps null: false
    end
  end
end
