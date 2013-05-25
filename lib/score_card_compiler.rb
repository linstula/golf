require 'pry'
require 'csv'

class ScoreCardCompiler

  def initialize(course_pars_filename, player_scores_filename)
    @course_pars = CourseLayout.new("course_layout").course
    # @course_pars = course.load_course
    @player_scores_filename = player_scores_filename
  end

  def create_player_scores_path
    @players_scores_path =  File.expand_path(File.dirname(__FILE__) + '/' + @player_scores_filename + '.csv')
    @players_scores_path
  end

  def parse_course_results
    @player_strokes = {}
    CSV.foreach(create_player_scores_path, 'r') do |player_scores|
      player_name = player_scores[0..1].reverse.join(" ")
      strokes = []
      player_scores[2..-1].each do |hole|
        strokes << hole.to_i
      end
      @player_strokes[player_name] = strokes
    end
    @player_strokes
  end















  # def player_scores
  #   @player_scores = {}
  #   players = @player_strokes.keys

  #   players.each do |player|
  #     @player_scores[player] = nil
  #   end

  #   p = 0
  #   @player_strokes.values.each do |player_strokes|
  #     scores = []
  #     i = 0
  #     player_strokes.each do |hole_strokes|
  #       scores << hole_strokes - @course_pars[i]
  #       i += 1
  #     end
  #     @player_scores[players[p]] = scores
  #     p += 1
  #   end

  #   @player_scores

  # end








end
