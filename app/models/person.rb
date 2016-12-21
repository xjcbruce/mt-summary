class Person < ActiveRecord::Base
  extend Enumerize

  enumerize :department, in: [:uidesign, :appdev, :serverdev, :pm, :prdanddev]

  enumerize :title, in: [:manager, :staff]

  validates :name, presence: true, uniqueness: true

  has_many :records, inverse_of: :target_person, foreign_key: 'target_person_id'

  has_one :annual_summary, inverse_of: :person

  before_create :generate_code
  def generate_code
    self.access_code = SecureRandom.hex(4)
  end

  def to_s
    attributes.to_s
  end

  def identity
    "#{self.department_text}#{self.title_text}"
  end

  def is_manager
    self.title != :mate ? true : false
  end

  def has_summary?
    (self.annual_summary.nil? or self.annual_summary.is_empty?) ? false : true
  end

  def salary_weight
    p = MagicParam.default.attributes

    if salary >= 14000
      return p["level_one_weight"]
    elsif salary >= 12000 and salary < 14000
      return p["level_two_weight"]
    elsif salary >= 10000 and salary < 12000
      return p["level_three_weight"]
    elsif salary >= 7000 and salary < 10000
      return p["level_four_weight"]
    elsif salary >= 5000 and salary < 7000
      return p["level_five_weight"]
    else salary < 5000
      return p["level_six_weight"].nil? ? 1.05 : p["level_six_weight"]
    end
  end

  def scores
    scores = Hash.new(0)

    mate_num = 0
    records.each do |r|
      result = r.calculate

      final = result["final"]
      # logger.debug "#{r.calculate}, s=#{s}, rater_type=#{r.rater_type}(#{r.rater_type.class})"
      if r.rater_type != :mate
        scores[r.rater_type.to_s] = final

        scores["normal"] += result["normal-total-weight"]
        scores["special"] += result["special-total-weight"]
        scores["growup"] += result["growup-total-weight"]

        if self.is_manager
          scores["team-normal"] += result["team-normal-total-weight"]
          scores["team-growup"] += result["team-growup-total-weight"]
        end
      else
        scores["mate"] += final
        scores["mate-normal"] += result["normal-total-weight"]
        scores["mate-special"] += result["special-total-weight"]
        scores["mate-growup"] += result["growup-total-weight"]

        if self.is_manager
          scores["mate-team-normal"] += result["team-normal-total-weight"]
          scores["mate-team-growup"] += result["team-growup-total-weight"]
        end
        mate_num += 1
      end
    end

    logger.debug "scores: #{scores}, mate_num=#{mate_num}"

    mate_num = 1 if mate_num == 0
    scores["mate"] = (scores["mate"] / mate_num)
    scores["normal"] += (scores["mate-normal"] / mate_num)
    scores["special"] += (scores["mate-special"] / mate_num)
    scores["growup"] += (scores["mate-growup"] / mate_num)

    if self.is_manager
      scores["team-normal"] += (scores["mate-team-normal"] / mate_num)
      scores["team-growup"] += (scores["mate-team-growup"] / mate_num)
    end

    scores["total"] = scores["boss"] + scores["manager"] + scores["mate"]

    scores["salary-mixed"] = scores["total"] * self.salary_weight

    scores.each_pair { |k, v| scores[k] = v.round(2) }
  end

end
