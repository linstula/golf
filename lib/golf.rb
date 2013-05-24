require 'csv'

class HoleLayout
  
  def initialize(course_layout_file_name)
    @course_layout_file_name = course_layout_file_name
  end

  def course_path
    File.expand_path(File.dirname(__FILE__) + '/' + @course_layout_file_name + '.csv')
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