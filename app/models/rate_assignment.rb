class RateAssignment < ActiveRecord::Base
  extend Enumerize

  enumerize :rater_type, in: [:boss, :manager, :mate]

  validates :url_code, uniqueness: true

  before_create :generate_code

  def generate_code
    self.url_code = SecureRandom.hex(4)
    # print "#{url_code}: #{self.to_s}\n"
  end

  def to_s
    attributes.to_s
  end

  def self.assignments_to(target_person_name)
    RateAssignment.where(target_person_name: target_person_name)
  end

  def self.target_to(rater_name)
    RateAssignment.where(rater_name: rater_name)
  end

  def self.target_number(rater_name)
    RateAssignment.where(rater_name: rater_name).count
  end

  def done?
    rater = Person.find_by(name: rater_name)
    target_person = Person.find_by(name: target_person_name)
    Record.find_by(rater: rater, target_person: target_person).nil? ? false : true
  end

end
