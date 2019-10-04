# Write your code here!

def game_hash
  hash={:home => {:team_name => "Brooklyn Nets",
                       :colors => ["Black", "White"], 
                       :players =>[{:player_name => "Alan Anderson", :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
                                   {:player_name => "Reggie Evans", :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
                                   {:player_name => "Brook Lopez", :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
                                   {:player_name => "Mason Plumlee", :number => 1, :shoe => 19, :points => 26, :rebounds => 11, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
                                   {:player_name => "Jason Terry", :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }]},
             :away => {:team_name => "Charlotte Hornets",
                       :colors => ["Turquoise", "Purple"], 
                       :players =>[{:player_name => "Jeff Adrien", :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 },
                                   {:player_name => "Bismack Biyombo", :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 22, :blocks => 15, :slam_dunks => 10 },
                                   {:player_name => "DeSagna Diop", :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 },
                                   {:player_name => "Ben Gordon", :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
                                   {:player_name => "Kemba Walker", :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 7, :blocks => 5, :slam_dunks => 12 }]}}
  hash
 end
 

def get_one_stat(stat,player_name)
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   pionts_scord_of_player=nil
   i = 0
   while a[i] do
    stat_of_player = a[i][stat] if a[i][:player_name]== player_name
    stat_of_player = aa[i][stat] if aa[i][:player_name]== player_name
    i += 1
   end 
   stat_of_player
 end
 

def num_points_scored(player_name)
  get_one_stat(:points,player_name)
 end
 

def shoe_size(player_name)
  get_one_stat(:shoe, player_name)
 end


def team_colors (team_name)
  h=game_hash
  colors = []
  if h[:home][:team_name]==team_name
     colors = h[:home][:colors]
  elsif h[:away][:team_name]==team_name
     colors = h[:away][:colors] 
  end
 end


def team_names
  h=game_hash
  names=[]
  names.push(h[:home][:team_name])
  names.push(h[:away][:team_name])
 end


def player_numbers(team_name) 
  h = game_hash
  numbers=[]
  ar_home=h[:home][:players]
  ar_away=h[:away][:players]
  if h[:home][:team_name]==team_name
    numbers = ar_home.map { |hash_of_player| hash_of_player[:number]}
  elsif h[:away][:team_name]==team_name
    numbers = ar_away.map { |hash_of_player| hash_of_player[:number]}
  end
    numbers
 end

def player_stats(player_name)
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   player_stats={}
   i = 0
   while a[i] do
    player_stats = a[i] if a[i][:player_name]== player_name
    player_stats = aa[i] if aa[i][:player_name]== player_name
    i += 1
   end 
   player_stats.delete(:player_name)
   player_stats
 end


def big_shoe_rebounds
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   i= 1
   rebounds_h=a[0][:rebounds]
   rebounds_a=aa[0][:rebounds]
   shoe_max_h=a[0][:shoe]
   shoe_max_a=aa[0][:shoe]
     while a[i] do
     (shoe_max_h=a[i][:shoe]
     rebounds_h=a[i][:rebounds]) if a[i][:shoe] > a[i-1][:shoe]
     (shoe_max_a=aa[i][:shoe]
     rebounds_a=aa[i][:rebounds]) if aa[i][:shoe] > aa[i-1][:shoe]
     i += 1
   end
   if shoe_max_h > shoe_max_a
    return rebounds_h
   else return rebounds_a
  end
 end


def most_points_scored
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   i= 1
   name_h=a[0][:player_name]
   name_a=aa[0][:player_name]
   points_h=a[0][:points]
   points_a=aa[0][:points]

   while a[i] do
     (points_h=a[i][:points]
     name_h=a[i][:player_name]) if a[i][:points] > points_h
     (points_a=aa[i][:points]
     name_a=aa[i][:player_name]) if aa[i][:points] > points_a
     i += 1
   end
   if points_h > points_a
     return name_h
   else return name_a
   end
 end


def winning_team
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   i= 0
   total_points_h= 0
   total_points_a= 0
   while a[i] do
     total_points_h += a[i][:points]
     total_points_a += aa[i][:points]
    i += 1
   end
   if total_points_h > total_points_a
     return h[:home][:team_name]
   else return h[:away][:team_name]
  end
 end


def player_with_longest_name
  h = game_hash
  players_names=[]
    ar_home=h[:home][:players]
    ar_away=h[:away][:players]
    players_names = ar_home.map { |hash_of_player| hash_of_player[:player_name]}
    players_names = players_names + ar_away.map { |hash_of_player| hash_of_player[:player_name]}
    players_names.max_by(&:length)
 end


def long_name_steals_a_ton?
   h= game_hash
   a= h[:home][:players]
   aa=h[:away][:players]
   i= 1
   name_h=a[0][:player_name]
   name_a=aa[0][:player_name]
   steals_h=a[0][:steals]
   steals_a=aa[0][:steals]
   name=""
   while a[i] do
   ( steals_h=a[i][:steals] 
   name_h = a[i][:player_name]) if a[i][:steals] > steals_h
   (steals_a = aa[i][:steals] 
   name_a = aa[i][:player_name]) if aa[i][:steals] > steals_a
   i += 1
 end
  if steals_h > steals_a
    name = name_h
  else name = name_a
  end
  name == player_with_longest_name
 end



