class SummaryItem < ActiveRecord::Base
  extend Enumerize

  enumerize :item_type, in: [:normal, :special, :growup, :team_normal, :team_growup]
  enumerize :item_no, in: { one: 1, two: 2, three: 3 }

  belongs_to :annual_summary, inverse_of: :summary_items

  def to_s
    attributes.to_s
  end
end