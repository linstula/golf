require 'pry'

require_relative 'score_card_compiler'
require_relative 'course_reader'
require_relative 'score_card_printer'

class Golf
  def initialize(course, player_scores)
    @course = CourseReader.new(course).load_course
    @player_scores = ScoreCardCompiler.new(player_scores).parse_course_results
  end

  def print_scores
    ScoreCardPrinter.new(@course, @player_scores).print_scores
  end
end