require "pry"

def game_hash
  base_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
          {"Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1}},
          {"Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7}},
          {"Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15}},
          {"Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 11, assists: 6, steals: 3, blocks: 8, slam_dunks: 5}},
          {"Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}}
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
          {"Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2}},
          {"Bismack Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 22, blocks: 15, slam_dunks: 10}},
          {"DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5}},
          {"Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0}},
          {"Kemba Walker" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 7, blocks: 5, slam_dunks: 12}}
      ]
    }
}
    return base_hash
end

def num_points_scored(playerName)
  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player.keys[0] == playerName
        return player[player.keys[0]][:points]
      end
    end
  end
end

def shoe_size(playerName)
  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player.keys[0] == playerName
        return player[player.keys[0]][:shoe]
      end
    end
  end
end

def team_colors(teamName)
  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    if teamData[:team_name] == teamName
      return teamData[:colors]
    end
  end
end

def team_names
  team_hash = game_hash
  name_array = []

  team_hash.each do |teamClassKey, teamData|
    name_array.push(teamData[:team_name])
  end

  name_array
end

def player_numbers(teamName)
  teams_hash = game_hash
  jersey_numbers = []

  teams_hash.each do |teamClassKey, teamData|
    if(teamData[:team_name] == teamName)
      teamData[:players].each do |player|
          jersey_numbers.push(player[player.keys[0]][:number])
      end
    end
  end

  return jersey_numbers
end

def player_stats(playerName)
  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player.keys[0] == playerName
        return player[player.keys[0]]
      end
    end
  end
end

def big_shoe_rebounds
  largestShoeSize = 0
  largestShoePlayer = nil

  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player[player.keys[0]][:shoe] > largestShoeSize
        largestShoeSize = player[player.keys[0]][:shoe]
        largestShoePlayer = player[player.keys[0]]
      end
    end
  end

  largestShoePlayer[:rebounds]
end

def most_points_scored
  mostPoints = 0
  mostPointsPlayer = nil

  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player[player.keys[0]][:points] > mostPoints
        mostPoints = player[player.keys[0]][:points]
        mostPointsPlayer = player.keys[0]
      end
    end
  end

  mostPointsPlayer
end

def winning_team
  awayPoints = 0;
  homePoints = 0;

  team_hash = game_hash

  team_hash.each do |teamClassKey, teamData|
      teamData[:players].each do |player|
        if teamClassKey == :home
          homePoints += player[player.keys[0]][:points]
        else
          awayPoints += player[player.keys[0]][:points]
        end
      end
  end

  if awayPoints > homePoints
    return team_hash[:away][:team_name]
  else
    return team_hash[:home][:team_name]
  end
end

def player_with_longest_name
  longest_name_numChars = 0
  longest_name_player = nil

  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player.keys[0].size > longest_name_numChars
        longest_name_numChars = player.keys[0].size
        longest_name_player = player.keys[0]
      end
    end
  end

  longest_name_player
end

def steals_the_most
  most_steals = 0
  most_steals_player = nil

  teams_hash = game_hash

  teams_hash.each do |teamClassKey, teamData|
    teamData[:players].each do |player|
      if player[player.keys[0]][:steals] > most_steals
        most_steals = player[player.keys[0]][:steals]
        most_steals_player = player.keys[0]
      end
    end
  end

  most_steals_player
end

def long_name_steals_a_ton?
  return player_with_longest_name == steals_the_most
end
