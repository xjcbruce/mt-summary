class CreateRateResults < ActiveRecord::Migration
  def change
    create_table :rate_results do |t|

      t.integer :person_id, null: false

      t.float :boss_point, :default => 0
      t.float :manager_point, :default => 0
      t.float :mate_one_point, :default => 0
      t.float :mate_two_point, :default => 0
      t.float :mate_three_point, :default => 0
      t.float :mate_average_point, :default => 0

      t.float :normal_total, :default => 0
      t.float :special_total, :default => 0
      t.float :growup_total, :default => 0
      t.float :team_normal_total, :default => 0
      t.float :team_growup_total, :default => 0

      t.float :salary_weight, :default => 0
      t.float :extra_point, :default => 0
      t.float :total, :default => 0

      t.integer :normal_rank, :default => 0
      t.integer :special_rank, :default => 0
      t.integer :growup_rank, :default => 0
      t.integer :team_normal_rank, :default => 0
      t.integer :team_growup_rank, :default => 0

      t.integer :team_rank, :default => 0
      t.integer :group_rank, :default => 0

      t.timestamps null: false
    end
  end
end
