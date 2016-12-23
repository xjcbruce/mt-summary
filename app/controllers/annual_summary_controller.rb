class AnnualSummaryController < ApplicationController
  def new
    render :text => '录入时间已过。。。'
    return
    
    @person = Person.find(person_params)

    if @person.nil?
      render :text => '查无此人。。。'
    end
  end

  def create
    p = form_params

    person = Person.find(p["person"])
    if person.nil?
      render :text => '查无此人。。。'
      return
    elsif person.annual_summary != nil
      person.annual_summary.destroy
    end

    summary = AnnualSummary.new
    summary.person = person

    %w(one two three).each do |i|
      content = p["normal_#{i}"]
      unless content.nil? or content.blank?
        summary.summary_items.build(item_type: :normal, item_no: i.to_sym, content: content)
      end
    end

    %w(one two three).each do |i|
      content = p["special_#{i}"]
      unless content.nil? or content.blank?
        summary.summary_items.build(item_type: :special, item_no: i.to_sym, content: content)
      end
    end

    %w(one two).each do |i|
      content = p["growup_#{i}"]
      unless content.nil? or content.blank?
        summary.summary_items.build(item_type: :growup, item_no: i.to_sym, content: content)
      end
    end

    if person.title == :manager
      %w(one two three).each do |i|
        content = p["team_normal_#{i}"]
        unless content.nil? or content.blank?
          summary.summary_items.build(item_type: :team_normal, item_no: i.to_sym, content: content)
        end
      end

      %w(one two).each do |i|
        content = p["team_growup_#{i}"]
        unless content.nil? or content.blank?
          summary.summary_items.build(item_type: :team_growup, item_no: i.to_sym, content: content)
        end
      end
    end

    if summary.save
      render :text => '提交成功!'
    else
      render :text => '提交失败。。。'
    end
  end

  def show
    @person = Person.find(person_params)
    if @person.nil?
      render :text => '查无此人。。。'
    elsif @person.annual_summary.nil?
      render :text => '总结尚未提交'
    end
  end

  private

  def person_params
    params.require(:id)
  end

  def form_params
    params.permit!
  end

end
