class VisitorsController < ApplicationController
  before_action :authenticate_user!

  def index
    @responses = group_by_date_epoch
    @max_marks = get_max_marks
    @chart = render_chart
  end

  def show
    @day_timestamp = params[:id].to_i
    @responses = Response.where(created_at: Time.at(@day_timestamp)...Time.at(@day_timestamp) + 24.hours)
  end

  def per_question_graph
    @responses = group_by_question_id
    @charts = []
    @responses.keys.each do |q_id|
      @charts << Fusioncharts::Chart.new({
        width: "450",
        height: "325",
        type: "column2d",
        renderAt: "q#{q_id}_chart"
        })
    end
  end

  private

  def group_by_date_epoch
    date_hash = Hash.new{ |h,k| h[k] = Array.new }
    responses = Response.where('created_at > ?', 30.days.ago)
    responses.each do |r|
      date_hash[r.created_at.beginning_of_day.to_i] << {question: r.question_id, marks: r.marks_received}
    end

    date_hash
  end

  def group_by_question_id
    question_id_group = Hash.new{ |h,k| h[k] = Array.new }
    responses = Response.where('created_at > ?', 30.days.ago)
    responses.each do |r|
      question_id_group[r.question_id] << {str: r.question.question_str, date: r.created_at.beginning_of_day, marks: r.marks_received}
    end

    question_id_group
  end

  def get_max_marks
    max_marks = Hash.new
    Question.find_each do |q|
      max_marks[q.id] = q.max_marks
    end

    max_marks
  end

  def render_chart
    Fusioncharts::Chart.new({
      width: "1100",
      height: "600",
      type: "column2d",
      renderAt: "chartContainer"
      })
  end
end
