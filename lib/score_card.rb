require 'csv'

class ScoreCard

  def initialize(player_scores_filename)
    @players_scores_path = create_player_scores_path(player_scores_filename)
  end

  def create_player_scores_path(player_scores_filename)
    File.expand_path(File.dirname(__FILE__) + '/' + player_scores_filename + '.csv')
  end

  def parse_course_results
    player_scores = {}
    CSV.foreach(@players_scores_path, 'r') do |indv_course_results|
      player_name = indv_course_results[0..1].reverse.join(" ")
      strokes = []
      indv_course_results[2..-1].each do |hole|
        strokes << hole.to_i
      end
      player_scores[player_name] = strokes
    end
    player_scores
  end
end