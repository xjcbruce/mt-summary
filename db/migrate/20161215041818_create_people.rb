class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|

      t.string :name, null: false, index: true
      t.string :department
      t.string :title
      t.integer :salary
      t.string :access_code

      t.timestamps null: false
    end
  end
end
