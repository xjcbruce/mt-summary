class RecordDetail < ActiveRecord::Base
  extend Enumerize

  belongs_to :record, inverse_of: :record_details

  enumerize :subject_type, in: [:normal, :special, :growup, :team_normal, :team_growup]
  enumerize :subject_answer_no, in: { one: 1, two: 2, three: 3 }
  enumerize :question_type, in: [:weight, :point]
  enumerize :point_option, in: { one: 1, two: 2, three: 3, four: 4, five: 5 }

  def to_s
    attributes.to_s
  end

  def real_value
    p = MagicParam.default.attributes

    if question_type == :weight
      value = p["point_#{point_option}_weight"]
    else
      value = p["given_#{point_option}_point"]
    end
    # logger.debug "value = #{value}"
    value
  end

end
