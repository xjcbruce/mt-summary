module PersonHelper

  def input_summary_label(person)
    person.has_summary? ? "重新录入" : "录入"
  end

  def target_entry_label(person)
    "#{RateAssignment.target_number(person.name)}个打分对象"
  end

  def li_item(item)
    item.empty? ? "" : "<li>#{item}</li>".html_safe
  end

end
