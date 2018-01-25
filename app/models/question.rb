class Question < ApplicationRecord
  has_many :responses
  before_save :set_defaults

  def max_marks
    max = marks1
    (2..4).each do |index|
      max = self["marks#{index}"] if self["marks#{index}"] > max
    end

    max
  end

  def set_defaults
    self["marks2"] ||= 0
    self["marks3"] ||= 0
    self["marks4"] ||= 0
  end

  def get_opt_by_marks(marks)
    (1..4).each do |index|
      return self["opt#{index}"] if marks == self["marks#{index}"]
    end

    return "(Data unavailable / marks changed)"

  end
end
