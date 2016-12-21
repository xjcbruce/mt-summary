class RecordController < ApplicationController

  def create
    assignment = RateAssignment.find_by(url_code: create_params)
    logger.debug "Find Assignment: #{assignment}"

    if assignment
      @rater = Person.find_by(name: assignment.rater_name)
      @target_person = Person.find_by(name: assignment.target_person_name)
      @rater_type = assignment.rater_type

      @summary = @target_person.annual_summary
      if @summary.nil?
        # @summary = AnnualSummary.new
        render :text => "#{@target_person.name}的2016总结还没有提交到系统..."
      end
    else
      render :nothing => true
    end
  end

  def rate
    logger.debug params
    logger.debug "record: #{rp}"

    target_person = Person.find(rp[:target_person])
    rater = Person.find(rp[:rater])

    if target_person.nil? or rater.nil?
      render :text => "查无此人"
      return
    end

    Record.delete_exist_record(rp[:rater], rp[:target_person])

    record = Record.new(
        target_person: target_person,
        rater: rater,
        rater_type: rp[:rater_type]
    )

    %w(normal special team_normal).each do |t|
      %w(one two three).each do |i|
        option_weight = dp["#{t}_#{i}_weight"]
        option_point = dp["#{t}_#{i}_point"]

        unless option_weight.nil? or option_point.nil?
          record.record_details.build(
              subject_type: t.to_sym,
              subject_answer_no: i,
              question_type: :weight,
              point_option: option_weight
          )

          record.record_details.build(
              subject_type: t.to_sym,
              subject_answer_no: i,
              question_type: :point,
              point_option: option_point
          )
        end
      end
    end

    %w(growup team_growup).each do |t|
      %w(one two).each do |i|
        option_point = dp["#{t}_#{i}_point"]

        unless option_point.nil?
          record.record_details.build(
              subject_type: t.to_sym,
              subject_answer_no: i,
              question_type: :point,
              point_option: option_point
          )
        end
      end
    end

    # logger.debug "生成Record: #{record}"
    # record.record_details.each { |detail| logger.debug "生成Details: #{detail}" }

    if record.save
      render :text => "提交成功!"
    else
      render :text => "提交出错了。。。"
    end

  end

  def list
    @person = Person.find(list_params)
    if @person != nil
      @records = @person.records
      # logger.debug "Record num for #{@person.name} is #{@records.count}"
    else
      render :text => "没有这个人。。。"
    end
  end

  def index
  end

  private

  def rp
    params.require(:record).permit(:target_person, :rater, :rater_type)
  end

  def dp
    params.permit!
  end

  def list_params
    params.require(:id)
  end

  def create_params
    params.require(:url_code)
  end

end
