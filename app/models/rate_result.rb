class RateResult < ActiveRecord::Base

  belongs_to :person, inverse_of: :rate_result

  validates :person, uniqueness: true

  def generate_points
    scores = self.person.scores

    self.boss_point = scores["boss"]
    self.manager_point = scores["manager"]
    self.mate_average_point = scores["mate"]
    self.mate_one_point, self.mate_two_point, self.mate_three_point = scores["mate-scores"]

    self.normal_total = scores["normal"]
    self.special_total = scores["special"]
    self.growup_total = scores["growup"]
    self.team_normal_total = scores["team-normal"]
    self.team_growup_total = scores["team-growup"]

    self.salary_weight = self.person.salary_weight
  end

  def calculate_total
    self.total = (boss_point + manager_point + mate_average_point) * salary_weight + extra_point
    self.total = self.total.round(2)
    self.total
  end

end
