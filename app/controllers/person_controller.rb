class PersonController < ApplicationController

  def index
    @persons = Person.all.order(salary: :desc)
  end

  def result
    @persons = Person.all
    # @results = Hash.new(0.0)
    #
    # @persons.each do |p|
    #   @results[p.id] = p.scores
    # end
  end

  def export_result_list
    @persons = Person.all
    # @results = Hash.new(0.0)
    #
    # @persons.each do |p|
    #   @results[p.id] = p.scores
    # end

    render :xlsx => "export_result_list", :filename => "2016list.xlsx"
    # respond_to do |format|
    #   format.xlsx
    # end
  end

  def list
    @department = department_param
    @persons = Person.where(department: @department)
    unless @persons
      render :text => "没有该部门。。。"
    end
  end

  def list_target
    @person = Person.find_by(access_code: code_param)
    unless @person
      render :text => "查无此人。。。"
      return
    end

    @assignments = RateAssignment.target_to(@person.name)
  end

  def report_to_one
    @person = Person.find_by(access_code: code_param)
    unless @person
      render :text => "查无此人。。。"
      return
    end

    @summary_items = @person.annual_summary.items
  end

  private

  def department_param
    params.require(:department)
  end

  def code_param
    params.require(:code)
  end
end
