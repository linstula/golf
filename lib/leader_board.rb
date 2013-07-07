class LeaderBoard

def initialize(pars, score_card)
  @par = pars.inject{ |sum, x| sum + x }
  @score_card = score_card
end

def total_score(player_scores)
  player_scores.inject{ |sum, x| sum + x }
end

def hashify_score_totals(players, player_scores)
  score_totals = {}
  i = 0
  players.each do |player|
    score_totals[player] = total_score(player_scores[i])
    i += 1
  end
  score_totals
end

def rank_by_score(score_totals)
  score_totals.sort_by{ |name, score| score}
end

def score_relative_to_par(player_total_score)
  player_total_score - @par
end

def print_leader_board

  score_totals = hashify_score_totals(@score_card.keys, @score_card.values)
  ranked_scores = rank_by_score(score_totals)

  puts "==LEADER BOARD=="

  ranked_scores.each do |player_score_pair|

    player = player_score_pair[0]
    score = player_score_pair[1]
    puts "#{score_relative_to_par(score)} #{score} #{player}"
  end 
  puts
end

end  