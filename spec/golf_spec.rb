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


describe ScoreCalc do

  let(:course_pars) {"course_layout"}
  let(:score_data) {"score_data"}
  let(:score_calc) {ScoreCalc.new(course_pars, score_data)}

  it "accepts 2 arguements on initialization" do
    score_calc
  end
  

  it "creates a path for the score data" do
    course_scores = score_calc
    file_path = course_scores.create_players_scores_path
    expect(File.exist?(file_path)).to be true
  end


  it "reads the score data from a file and returns a hash" do
    course_scores = score_calc
    expect(course_scores.parse_scores).to be_kind_of(Hash)
  end
    

  it "returns an array of a player's scores when a player is called"
     

  
end









