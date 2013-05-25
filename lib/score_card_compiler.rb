require 'csv'

class ScoreCardCompiler

  attr_reader :course_scores

  def initialize(course_pars_filename, player_scores_filename)
    @course_pars = CourseLayout.new("course_layout").course
    # @course_pars = course.load_course
    @players_scores_path = create_player_scores_path(player_scores_filename)
    @course_scores = parse_course_results
  end

  def create_player_scores_path(player_scores_filename)
    File.expand_path(File.dirname(__FILE__) + '/' + player_scores_filename + '.csv')
  end

  def parse_course_results
    @player_scores = {}
    CSV.foreach(@players_scores_path, 'r') do |indv_course_results|
      player_name = indv_course_results[0..1].reverse.join(" ")
      strokes = []
      indv_course_results[2..-1].each do |hole|
        strokes << hole.to_i
      end
      @player_scores[player_name] = strokes
    end
    @player_scores
  end















  # def player_scores
  #   @player_scores = {}
  #   players = @player_scores.keys

  #   players.each do |player|
  #     @player_scores[player] = nil
  #   end

  #   p = 0
  #   @player_scores.values.each do |player_scores|
  #     scores = []
  #     i = 0
  #     player_scores.each do |hole_strokes|
  #       scores << hole_strokes - @course_pars[i]
  #       i += 1
  #     end
  #     @player_scores[players[p]] = scores
  #     p += 1
  #   end

  #   @player_scores

  # end








end
