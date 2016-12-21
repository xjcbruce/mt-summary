class Record < ActiveRecord::Base
  extend Enumerize

  belongs_to :target_person, class_name: 'Person', inverse_of: :records
  belongs_to :rater, class_name: 'Person'

  enumerize :rater_type, in: [:boss, :manager, :mate]

  has_many :record_details, inverse_of: :record, dependent: :delete_all

  def self.rater_type_text(rater_type)
    I18n.t "enumerize.record.rater_type.#{rater_type}"
  end

  def to_s
    attributes.to_s
  end

  def answer_options
    r = Hash.new(0.0)
    record_details.each do |detail|
      key = "#{detail.subject_type}-#{detail.subject_answer_no}-#{detail.question_type}"
      r[key] = detail.point_option_value
    end
    r
  end

  def answer_values
    r = Hash.new(0.0)
    record_details.each do |detail|
      key = "#{detail.subject_type}-#{detail.subject_answer_no}-#{detail.question_type}"
      r[key] = detail.real_value
    end
    r
  end

  def calculate
    v = answer_values
    p = MagicParam.default.attributes
    r = Hash.new(0.0)

    %w(one two three).each do |i|
      r["normal-total"] += (v["normal-#{i}-weight"] * v["normal-#{i}-point"])
    end
    r["normal-total"] *= p["subject_normal_weight"]
    r["normal-total-weight"] = r["normal-total"] * p["rater_#{rater_type}_weight"]


    %w(one two three).each do |i|
      r["special-total"] += (v["special-#{i}-weight"] * v["special-#{i}-point"])
    end
    r["special-total"] *= p["subject_special_weight"]
    r["special-total-weight"] = r["special-total"] * p["rater_#{rater_type}_weight"]


    %w(one two).each do |i|
      r["growup-total"] += v["growup-#{i}-point"]
    end
    r["growup-total"] *= p["subject_growup_weight"]
    r["growup-total-weight"] = r["growup-total"] * p["rater_#{rater_type}_weight"]


    if self.target_person.is_manager
      %w(one two three).each do |i|
        r["team-normal-total"] += (v["team_normal-#{i}-weight"] * v["team_normal-#{i}-point"])
      end
      r["team-normal-total"] *= p["subject_normal_weight"]
      r["team-normal-total-weight"] = r["team-normal-total"] * p["rater_#{rater_type}_weight"]

      %w(one two).each do |i|
        r["team-growup-total"] += v["team_growup-#{i}-point"]
      end
      r["team-growup-total"] *= p["subject_growup_weight"]
      r["team-growup-total-weight"] = r["team-growup-total"] * p["rater_#{rater_type}_weight"]
    end

    r["source-total"] = r["normal-total"] + r["special-total"] + r["growup-total"]
    if self.target_person.is_manager
      r["source-total"] += (r["team-normal-total"] + r["team-growup-total"])
    end

    r["rater-total"] = r["source-total"] * p["rater_#{rater_type}_weight"]
    r["final"] = r["rater-total"]

    r.each_pair { |k, v| r[k] = v.round(2) }
  end

  def answers
    answers = {}
    record_details.each do |detail|
      key = "#{detail.subject_type}-#{detail.subject_answer_no}-#{detail.question_type}"
      answers[key] = [detail.point_option_value, detail.real_value]
    end
    answers
  end

  def self.delete_exist_record(rater_id, target_person_id)
    record = Record.find_by(rater: rater_id, target_person: target_person_id)
    logger.debug "Found exist record: #{record}"
    record.destroy unless record.nil?
  end

end
