require 'pry'

require_relative 'score_card'
require_relative 'course_reader'
require_relative 'score_card_printer'
require_relative 'leader_board'

class Golf
  def initialize(course, player_scores)
    @course = CourseReader.new(course).load_course
    @player_scores = ScoreCard.new(player_scores).parse_course_results
  end

  def print_scores
    ScoreCardPrinter.new(@course, @player_scores).print_scores
    LeaderBoard.new(@course, @player_scores).print_leader_board
  end
end