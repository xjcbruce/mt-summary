class AnnualSummary < ActiveRecord::Base

  belongs_to :person, inverse_of: :annual_summary

  has_many :summary_items, inverse_of: :annual_summary, dependent: :delete_all

  def to_s
    attributes.to_s
  end

  def items
    r = Hash.new("")
    summary_items.each do |item|
      r["#{item.item_type}-#{item.item_no}"] = item.content
    end
    r
  end

  def is_empty?
    (summary_items.nil? or summary_items.count < 1) ? true : false
  end

end
