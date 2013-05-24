require 'rspec'

require_relative '../lib/golf'

describe HoleLayout do

  let(:course_file_name) do
    'test'
  end

  let(:valid_course) do
    HoleLayout.new(course_file_name)
  end
  
  it 'should take in an arguement on initialization' do
    course = valid_course
    expect(course.nil?).to be false
  end

  it 'creates a valid path to a file name passed in on initialization' do
    course = valid_course
    path = course.course_path
    expect(File.exist?(path)).to be true
  end

  it 'returns an array containing the course data for a 18 hole course' do
    course = valid_course
    course_data = course.load_course
    expect(course_data.count).to eql(18)
  end

end