require 'pry'
require 'csv'

class HoleLayout
  
  def initialize(course_file_name)
    @course_file_name = course_file_name
  end

  def course_path
    File.expand_path(File.dirname(__FILE__) + '/' + @course_file_name + '.csv')
  end

  def load_course
    course_data = []
    CSV.foreach(course_path, 'r') do |row|
      row.each do |hole|
        course_data << hole.to_i
      end
    end
    course_data
  end
end



class ScoreCalc

  def initialize(course_pars_filename, player_scores_filename)
    course = HoleLayout.new(course_pars_filename)
    @course_pars = course.load_course
    @player_scores_filename = player_scores_filename
  end

  def create_player_scores_path
    @players_scores_path =  File.expand_path(File.dirname(__FILE__) + '/' + @player_scores_filename + '.csv')
    @players_scores_path
  end

  def parse_scores
    @player_scores = {}
    CSV.foreach(create_player_scores_path, 'r') do |player_scores|
      player_name = player_scores[0..1].reverse.join(" ")
      @player_scores[player_name] = player_scores[2..-1]
    end
    @player_scores
  end


end












