require 'csv'

class CourseReader

  attr_reader :course
  
  def initialize(course_filename)
    @course_filename = course_filename
    @course = load_course
  end

  def course_path(course_filename)
    File.expand_path(File.dirname(__FILE__) + '/' + course_filename + '.csv')
  end

  def load_course
    course_data = []
    CSV.foreach(course_path(@course_filename), 'r') do |row|
      row.each do |hole|
        course_data << hole.to_i
      end
    end
    course_data
  end
end