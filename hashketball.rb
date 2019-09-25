def game_hash
  all_data = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => [
        { 'Alan Anderson'=> { :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 }},
        { 'Reggie Evans'=> { :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 }},
        { 'Brook Lopez'=> { :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 }},
        { 'Mason Plumlee' => { :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 }},
        { 'Jason Terry'=> { :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }}
      ]
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => [
        { 'Jeff Adrien' => { :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 }},
        { 'Bismack Biyombo' => { :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10 }},
        { 'DeSagna Diop' => { :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 }},
        { 'Ben Gordon' => { :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 }},
        { 'Kemba Walker' => { :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12 }},
      ]
    }
  }
all_data
end

def num_points_scored(name)
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)
  points = ''

  array_names.each do |key|
    key.each do |player_name, info|
      if player_name == name
        points = info[:points]
      end
    end
  end
  points
end

def shoe_size(name)
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)
  shoe = ''

  array_names.each do |key|
    key.each do |player_name, info|
      if player_name == name
        shoe = info[:shoe]
      end
    end
  end
  shoe
end

def team_colors(name)
  x = game_hash
  colors = ''
  x.each do |home_away, info|
    info.each do |key, value|
      if value == (name)
        colors = info[:colors]
      end
    end
  end
  colors
end

def team_names
  x = game_hash
  team_names = []
    team_names.push x[:home][:team_name]
    team_names.push x[:away][:team_name]
    team_names
end

def player_numbers(team_name)
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  home_numbers = []
  home_numbers.sort!
  away_numbers = []
  away_numbers.sort!

  y.each do |name|
    name.each do |k, v|
      home_numbers << v[:number]
    end
  end
  z.each do |name|
    name.each do |k, v|
      away_numbers << v[:number]
    end
  end
  if x[:home][:team_name] == team_name
    home_numbers
  elsif x[:away][:team_name] == team_name
    away_numbers
  end
end

def player_stats (name)
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)

  array_names.each do |key|
    key.each do |player_name, info|
      if player_name == name
        return info
      end
    end
  end
end

def big_shoe_rebounds
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)
  shoes_array = []

  array_names.each do |key|
    key.each do |k, v|
      shoes_array << v[:shoe]
      end
  end
  
  shoes_array.sort!
  biggest_shoes = shoes_array[-1]
  rebounds = ''

  array_names.each do |key|
    key.each do |k, v|
      if v[:shoe] == biggest_shoes
        rebounds = v[:rebounds]
      end
    end
  end
  rebounds
end

def most_points_scored
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)
  points = []

  array_names.each do |key|
    key.each do |k, v|
      points << v[:points]
    end
  end

  points.sort!
  most_points = points[-1]
  hottest_player = ''

  array_names.each do |key|
    key.each do |k, v|
      if v[:points] == most_points
        hottest_player = key.key(v)
      end
    end
  end
  hottest_player
end

def winning_team
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  home_numbers = []
  away_numbers = []

  y.each do |name|
    name.each do |k, v|
      home_numbers << v[:points]
    end
  end
  z.each do |name|
    name.each do |k, v|
      away_numbers << v[:points]
    end
  end

  total_home_numbers = home_numbers.sum
  total_away_numbers = away_numbers.sum

  home = x[:home][:team_name]
  away = x[:away][:team_name]

  if total_away_numbers > total_home_numbers
    away
    elsif total_home_numbers > total_away_numbers
      home
    end
  end
  
  def player_with_longest_name
  x = game_hash
  y = x[:home][:players]
  z = x[:away][:players]
  array_names = y.concat(z)
  player_names = []

  array_names.each do |key|
    key.each do |k, v|
      player_names << key.key(v)
    end
  end

  char_count = {}

  player_names.each do |name|
    char_count[name] = name.size
  end

  sorted = char_count.sort_by {|k, v| v}
  longest_name = sorted[-1]
  longest_name[0]
end