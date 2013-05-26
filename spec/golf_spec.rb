require 'rspec'

require_relative '../lib/golf'


describe CourseReader do

  let(:course_filename) do
    'test'
  end

  let(:valid_course) do
    CourseReader.new(course_filename)
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


describe ScoreCard do

  let(:player_scores_filename) { 'course_score_data' }
  let(:score_calc) {ScoreCard.new("course_score_data")}

  it "creates a path for the score data" do
    course_scores = score_calc
    file_path = course_scores.create_player_scores_path(player_scores_filename)
    expect(File.exist?(file_path)).to be true
  end

  it "reads the score data from a file and returns a hash of player/scores pairs" do
    course_scores = score_calc
    expect(course_scores.parse_course_results).to_not be_empty
  end
end


describe ScoreCardPrinter do

  let(:printer) {ScoreCardPrinter.new('course_pars', 'course_scores')}

  let(:pars)    { [4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3] }
  let(:scores)  { [3, 4, 5, 6, 7, 8, 8, 7, 6, 5, 4, 3, 3, 4, 5, 6, 7, 8] }


  it "accepts course par data and course score data on initialization" do
    printer
  end

  it "gets a players name" do 
    expect(printer.get_name("Lin")).to include("Lin")
  end

  it "calculates the hole number" do
    expect(printer.hole_num(1)).to include("1")
  end

  it "calculates the par for the hole" do
    expect(printer.hole_par(3)).to include('3')
  end

  it "calculates the score difference from par" do
    par = 3
    score = 4
    expect(printer.diff_from_par(score,par)).to eql(1)
  end

  it "it provides a golf score in words" do
    diff_from_par = 1
    expect(printer.score_in_words(diff_from_par)).to include("Bogey")
  end

  it "calculates the total score" do
    expect(printer.total_score(scores)).to include("99")
  end

  it "calculates the total difference from par" do
    expect(printer.total_diff_from_par(pars, scores)).to include("27")
  end
end


describe Golf do

  it "initializes with a course filename and a player_scores filename" do
    expect{Golf.new('course_layout', 'course_score_data')}.to_not raise_error(ArgumentError)
  end
end

describe LeaderBoard do

  let(:pars)          { [4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3] }
  let(:scores)        { [3, 4, 5, 6, 7, 8, 8, 7, 6, 5, 4, 3, 3, 4, 5, 6, 7, 8] }
  let(:players)       { ["Abi", "Lin"] }
  let(:player_scores) { [[3, 4, 5, 6, 7, 8, 8, 7, 6, 5, 4, 3, 3, 4, 5, 6, 7, 8], [4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3]]}
  let(:score_card)    { {"Abi" => 85, "Lin" => 75} }
  let(:valid_leader_board)  { LeaderBoard.new(pars, score_card) }

  it "initializes with pars for the course and with a scorecard" do
    expect{LeaderBoard.new(pars, scores)}.to_not raise_error(ArgumentError)
  end

  it "calculates the total score for a player" do
    leader_board = valid_leader_board
    player_scores = scores
    expect(leader_board.total_score(player_scores)).to eql(99)
  end

  it "creates a hash of players and their total scores" do
    leader_board = valid_leader_board
    player_score_totals = leader_board.hashify_score_totals(players, player_scores)
    expect(leader_board.hashify_score_totals(players, player_scores)).to be_kind_of(Hash)
    expect(player_score_totals["Lin"]).to eql(72)
  end

  it "ranks total scores starting with the lowest score" do
    ranked_scores = valid_leader_board.rank_by_score(score_card)
    expect(ranked_scores[0][1]).to eql(75)
  end

  it "calculates the difference between a players total score and par for the course" do
    expect(valid_leader_board.score_relative_to_par(score_card["Abi"])).to eql(13)
  end
end



