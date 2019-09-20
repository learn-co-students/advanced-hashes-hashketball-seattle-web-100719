require "pry"

def game_hash
  hash = {}
  hash[:home] = {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => [
      {:name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
      {:name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
      {:name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
      {:name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
      {:name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
    ]
  }
  hash[:away] = {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise", "Purple"],
    :players => [
      {:name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
      {:name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10},
      {:name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
      {:name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
      {:name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12}
    ]
  }
  hash
end


def num_points_scored(player_name)
  points = 0
  game_hash[:home][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name
        points = element.values[3]
      end
    end
  end
  game_hash[:away][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name
        points = element.values[3]
      end
    end
  end
  points
end

def shoe_size(player_name)
  size = 0
  game_hash[:home][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name
        size = element.values[2]
      end
    end
  end
  game_hash[:away][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name
        size = element.values[2]
      end
    end
  end
  size
end


def team_colors(name)
  team_colors = []
  if game_hash[:home][:team_name] === name
    team_colors = game_hash[:home][:colors]
  end
  if game_hash[:away][:team_name] === name
    team_colors = game_hash[:away][:colors]
  end
  team_colors
end

def team_names
  result = [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(name)
  result = []
  if game_hash[:home][:team_name] === name
    game_hash[:home][:players].each do |element|
      result.push(element.values[1])
    end
  end
  if game_hash[:away][:team_name] === name
    game_hash[:away][:players].each do |element|
      result.push(element.values[1])
    end
  end
  result
end

def player_stats(player_name)
  result = {}
  game_hash[:home][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name && key != :name
        result[key] = value
      end
    end
  end
  game_hash[:away][:players].each do |element|
    element.each do |key, value|
      if element.values[0] === player_name && key != :name
        result[key] = value
      end
    end
  end
  result
end

def big_shoe_rebounds
  largest_size = game_hash[:home][:players][0][:shoe]
  largest_person_rebounds = game_hash[:home][:players][0][:rebounds]

  game_hash[:home][:players].each do |element|
    if element[:shoe] > largest_size
      largest_size = element[:shoe]
      largest_person_rebounds = element[:rebounds]
    end
  end

  game_hash[:away][:players].each do |element|
    if element[:shoe] > largest_size
      largest_size = element[:shoe]
      largest_person_rebounds = element[:rebounds]
    end
  end

  largest_person_rebounds
end

def most_points_scored
  most_points = game_hash[:home][:players][0][:points]
  player_most_points = game_hash[:home][:players][0][:name]

  game_hash[:home][:players].each do |element|
    if element[:points] > most_points
      most_points = element[:points]
      player_most_points = element[:name]
    end
  end

  game_hash[:away][:players].each do |element|
    if element[:points] > most_points
      most_points = element[:points]
      player_most_points = element[:name]
    end
  end

  player_most_points
end

def winning_team
  total_home = 0
  game_hash[:home][:players].each do |element|
    element.each do |key, value|
      if key === :points
        total_home += element[:points]
      end
    end
  end

  total_away = 0
  game_hash[:away][:players].each do |element|
    element.each do |key, value|
      if key === :points
        total_home += element[:points]
      end
    end
  end

  total_home > total_away ? game_hash[:home][:team_name] : game_hash[:away][:team_name]
end

def player_with_longest_name
  longest_name = game_hash[:home][:players][0][:name]

  game_hash[:home][:players].each do |element|
    if element[:name].length > longest_name.length
      longest_name = element[:name]
    end
  end

  game_hash[:away][:players].each do |element|
    if element[:name].length > longest_name.length
      longest_name = element[:name]
    end
  end

  longest_name
end

def long_name_steals_a_ton?
  player_with_longest_name

  most_steals = game_hash[:home][:players][0][:steals]
  most_steals_player = game_hash[:home][:players][0][:name]

  game_hash[:home][:players].each do |element|
    if element[:steals] > most_steals
      most_steals = element[:steals]
      most_steals_player = element[:name]
    end
  end

  game_hash[:away][:players].each do |element|
    if element[:steals] > most_steals
      most_steals = element[:steals]
      most_steals_player = element[:name]
    end
  end

  most_steals_player === player_with_longest_name ? true : false
end
