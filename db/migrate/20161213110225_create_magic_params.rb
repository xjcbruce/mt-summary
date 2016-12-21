class CreateMagicParams < ActiveRecord::Migration
  def change
    create_table :magic_params do |t|

      t.float :subject_normal_weight, :default => 0
      t.float :subject_special_weight, :default => 0
      t.float :subject_growup_weight, :default => 0

      t.float :rater_boss_weight, :default => 0
      t.float :rater_manager_weight, :default => 0
      t.float :rater_mate_weight, :default => 0

      t.float :point_five_weight, :default => 0
      t.float :point_four_weight, :default => 0
      t.float :point_three_weight, :default => 0
      t.float :point_two_weight, :default => 0
      t.float :point_one_weight, :default => 0

      t.float :given_five_point, :default => 0
      t.float :given_four_point, :default => 0
      t.float :given_three_point, :default => 0
      t.float :given_two_point, :default => 0
      t.float :given_one_point, :default => 0

      t.float :level_one_weight, :default => 0
      t.float :level_two_weight, :default => 0
      t.float :level_three_weight, :default => 0
      t.float :level_four_weight, :default => 0
      t.float :level_five_weight, :default => 0
      t.float :level_six_weight, :default => 0

      t.timestamps null: false
    end
  end
end
