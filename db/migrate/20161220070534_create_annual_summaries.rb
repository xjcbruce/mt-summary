class CreateAnnualSummaries < ActiveRecord::Migration
  def change
    create_table :annual_summaries do |t|
      t.integer :person_id, null: false

      t.timestamps null: false
    end

    create_table :summary_items do |t|
      t.references :annual_summary, null: false
      t.string :item_type, null: false
      t.integer :item_no, null: false, default: 0
      t.text :content

      t.timestamps null: false
    end
  end
end
