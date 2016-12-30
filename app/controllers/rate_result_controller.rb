class RateResultController < ApplicationController

  def write
    persons = Person.where.not(name: "杨宇波")

    persons.each do |p|
      rate_result = p.rate_result
      rate_result = p.build_rate_result if rate_result.nil?

      if ["樊勇建", "张耀", "王雨乔", "宋伟", "杨建中", "宋生洪"].include?(p.name)
        rate_result.extra_point = 10
      end

      rate_result.generate_points
      rate_result.calculate_total

      rate_result.save
    end

    results = RateResult.all
    results.sort_by { |r| -r.normal_total }.each_with_index { |r, i| r.normal_rank = i + 1 }
    results.sort_by { |r| -r.special_total }.each_with_index { |r, i| r.special_rank = i + 1 }
    results.sort_by { |r| -r.growup_total }.each_with_index { |r, i| r.growup_rank = i + 1 }
    results.sort_by { |r| -r.total }.each_with_index { |r, i| r.team_rank = i + 1 }
    results.each { |r| r.save }

    results = RateResult.where.not(team_normal_total: 0)
    results.sort_by { |r| -r.team_normal_total }.each_with_index { |r, i| r.team_normal_rank = i + 1 }
    results.sort_by { |r| -r.team_growup_total }.each_with_index { |r, i| r.team_growup_rank = i + 1 }
    results.sort_by { |r| -r.total }.each_with_index { |r, i| r.group_rank = i + 1 }
    results.each { |r| r.save }

    %w(uidesign appdev serverdev pm).each do |d|
      results = RateResult.includes(:person).where(people: { department: d, title: :staff })
      results.sort_by { |r| -r.total }.each_with_index { |r, i| r.group_rank = i + 1 }
      results.each { |r| r.save }
    end

    render :text => "写入完毕!"
  end

  def report
    @person = Person.find_by(access_code: code_param)

    @summary = @person.annual_summary.items
    @result = @person.rate_result

    @numbers = [Person.staff_number, Person.staff_number(@person.department)]
    if @person.is_manager
      @numbers[1] = 4
    end

    respond_to do |format|
      format.html # report.html.erb
      format.xlsx { render xlsx: "report", filename: "#{@person.name}的2016年终总结报告.xlsx" }
    end
  end

  private

  def code_param
    params.require(:code)
  end

end
