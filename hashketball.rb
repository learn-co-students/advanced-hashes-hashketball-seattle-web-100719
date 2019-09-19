# Write your code here!
require "pry"



def num_points_scored(name)
  #Takes player and returns points scored
  game = game_hash
  game.keys.each do |team|
    game[team][:players].each do |player|
      if player[:name] == name
        return player[:points]
      end
    end
  end
  return 'Player not in game'
end

def shoe_size(name)
  #Takes player and returns shoe size
  game = game_hash
  game.keys.each do |team|
    game[team][:players].each do |player|
      if player[:name] == name
        return player[:shoe]
      end
    end
  end
  return 'Player not in game'
end

def team_colors(name)
  #Takes team and returns team color
  game = game_hash
  game.keys.each do |team|
    if game[team][:team_name] == name
      return game[team][:colors]
    end
  end
end

def team_names
  #Takes team and returns team name
  game = game_hash
  teams = []
  game.keys.each do |team|
    teams.push(game[team][:team_name])
  end
  return teams
end

def player_numbers(name)
  game = game_hash
  jerseys = []
  game.keys.each do |team|
    if game[team][:team_name] == name
      game[team][:players].each do |player|
        jerseys.push(player[:number])
      end
    end
  end
  return jerseys
end

def player_stats(name)
  game = game_hash
  game.keys.each do |team|
    game[team][:players].each do |player|
      if player[:name] == name
        stats = player
        stats.delete(:name)
        return stats
      end
    end
  end
end

def big_shoe_rebounds
  game = game_hash
  stats = [0, 0]
  game.keys.each do |team|
    game[team][:players].each do |player|
      if player[:shoe] > stats[0]
        stats = [player[:shoe], player[:rebounds]]
      end
    end
  end
  return stats[1]
end

def most_points_scored
  game = game_hash
  top_scorer = ['', 0]
  game.keys.each do |team|
    game[team][:players].each do |player|
      if player[:points] > top_scorer[1]
        top_scorer = [player[:name], player[:points]]
      end
    end
  end
  return top_scorer[0]
end

def winning_team
  game = game_hash
  away_total = 0 
  home_total = 0 
  game[:home][:players].each do |player|
    home_total += player[:points]
  end
  game[:away][:players].each do |player|
    away_total += player[:points]
  end
  return away_total > home_total ? game[:away][:team_name] : game[:home][:team_name]
end

def player_with_longest_name
  game = game_hash
  longest_name = ['', 0]
  game.keys.each do |team|
    game[team][:players].each do |player|
      if longest_name[1] < player[:name].length
        longest_name = [player[:name], player[:name].length]
      end
    end
  end
  return longest_name[0]
end

def long_name_steals_a_ton?
  game = game_hash
  longest_name = ['', 0]
  most_steals = ['', 0]
  game.keys.each do |team|
    game[team][:players].each do |player|
      if longest_name[1] < player[:name].length
        longest_name = [player[:name], player[:name].length]
      end
      if most_steals[1] < player[:steals]
        most_steals = [player[:name], player[:steals]]
      end
    end
  end
  return most_steals[0] == longest_name[0]
end
  

def create_player(name, number, shoe, points, rebounds, assists, steals, blocks, slam_dunks)
  player = {name: name, number: number, shoe: shoe, points: points, rebounds: rebounds, assists: assists, steals: steals, blocks: blocks, slam_dunks: slam_dunks}
  player
end

def create_game(home_team, away_team)
  game = {home: {
    team_name: home_team[0],
    colors: home_team[1],
    players: []
  }, 
  away: {
    team_name: away_team[0],
    colors: away_team[1],
    players: []
  }}
  return game
end

def game_hash
  game = create_game(['Brooklyn Nets', ['Black', 'White']], ['Charlotte Hornets', ['Turquoise', 'Purple']])
  game[:home][:players] = [
    create_player('Alan Anderson', 0, 16, 22, 12, 12, 3, 1, 1), 
    create_player('Reggie Evans', 30, 14, 12, 12, 12, 12, 12, 7),
    create_player('Brook Lopez', 11, 17, 17, 19, 10, 3, 1, 15),
    create_player('Mason Plumlee', 1, 19, 26, 11, 6, 3, 8, 5),
    create_player('Jason Terry', 31, 15, 19, 2, 2, 4, 11, 1)
    ]
  game[:away][:players] = [
    create_player('Jeff Adrien', 4, 18, 10, 1, 1, 2, 7, 2), 
    create_player('Bismack Biyombo', 0, 16, 12, 4, 7, 22, 15, 10),
    create_player('DeSagna Diop', 2, 14, 24, 12, 12, 4, 5, 5),
    create_player('Ben Gordon', 8, 15, 33, 3, 2, 1, 1, 0),
    create_player('Kemba Walker', 33, 15, 6, 12, 12, 7, 5, 12)
    ]
  game
end

def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      binding.pry
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end
  







