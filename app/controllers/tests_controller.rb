class TestsController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def new
    @questions = Question.all
  end

  def create
    process_create
    respond_to do |format|
      format.html { redirect_to root_url, notice: 'Test submitted.' }
    end
  end

  private

  def process_create
    questions = Question.count
    (1..questions).each do |q|
      if params.has_key?("question#{q}")
        opt = params["question#{q}"]
        response = Response.new(question_id: q, marks_received: Question.find(q)["marks#{opt}"])
        response.save
      end
    end
  end
end
