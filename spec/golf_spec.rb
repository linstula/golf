require 'rspec'

require_relative '../lib/golf'


describe CourseLayout do

  let(:course_filename) do
    'test'
  end

  let(:valid_course) do
    CourseLayout.new(course_filename)
  end

  it 'creates a valid path to a file name passed in on initialization' do
    course = valid_course
    path = course.course_path(course_filename)
    expect(File.exist?(path)).to be true
  end

  it 'returns an array containing the course data for a 18 hole course' do
    course = valid_course
    course_data = course.load_course
    expect(course_data.count).to eql(18)
  end
end


describe ScoreCardCompiler do

  let(:player_scores_filename) { 'course_score_data' }
  let(:score_calc) {ScoreCardCompiler.new("course_layout", "course_score_data")}
 
  it "accepts 2 arguements on initialization" do
    score_calc
  end
  

  it "creates a path for the score data" do
    course_scores = score_calc
    file_path = course_scores.create_player_scores_path(player_scores_filename)
    expect(File.exist?(file_path)).to be true
  end


  it "reads the score data from a file and returns a hash of player/strokes pairs" do
    course_scores = score_calc
    expect(course_scores.parse_course_results).to_not be_empty
  end
end


describe ScoreCardPrinter do





end








