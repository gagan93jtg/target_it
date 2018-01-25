module TestsHelper
  def get_total_marks(max_marks, questions)
    sum_marks = 0
    questions.each do |q|
      sum_marks+= max_marks[q]
    end

    sum_marks
  end
end
