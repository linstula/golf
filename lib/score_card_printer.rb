class ScoreCardPrinter

  def initialize(course_pars, course_scores)
    @course_pars = course_pars
    @course_scores = course_scores
  end

  def get_name(name)
    "== #{name}"
  end

  def hole_num(num)
    "Hole #{num}: "
  end

  def hole_par(par)
    "#{par} - "
  end

  def diff_from_par(score, par)
    score - par 
  end

  def score_in_words(num)
    case num
    when -3
      "Albatross"
    when -2
      "Eagle"
    when -1
      "Birdie"
    when 0
      "Par"
    when 1
      "Bogey"
    when 2
      "Double Bogey"
    when 3
      "Triple Bogey"
    else
      ""
    end
  end

  def total_score(scores)
    "Total Score: #{scores.inject{ |sum, x| sum + x }}"
  end

  def total_diff_from_par(pars, player_scores)
    score = player_scores.inject{ |sum, x| sum + x }
    par = pars.inject{ |sum, x| sum + x }
    "#{score - par}"
  end

  def print_scores
    @course_scores.keys.each do |player|
      puts get_name(player)
      i = 0
      scores = @course_scores[player]
      pars = @course_pars
      scores.each do |score|
        print hole_num(i + 1)
        print hole_par(pars[i])
        puts score_in_words(diff_from_par(score, pars[i]))
        i += 1
      end
      puts
      puts total_score(scores)
      puts total_diff_from_par(pars, scores)
      puts "=="
      puts
      puts
    end 
  end







end