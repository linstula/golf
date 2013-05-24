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

  def initialize(course_pars_filename, players_score_filename)
    course = HoleLayout.new(course_pars_filename)
    @course_pars = course.load_course
    @players_score_filename = players_score_filename
  end

  def create_players_scores_path
    @players_scores_path =  File.expand_path(File.dirname(__FILE__) + '/' + @players_score_filename + '.csv')
    @players_scores_path
  end

  def parse_scores
    {}
  end


end












