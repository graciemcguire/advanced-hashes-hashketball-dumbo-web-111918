
def game_hash
{
  :home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black","White"],
    :players => {
    "Alan Anderson" => {
      :number => 0,
      :shoe => 16,
      :points => 22,
      :rebounds => 12,
      :assists => 12,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 1
    },
    "Reggie Evans" => {
      :number => 30,
      :shoe => 14,
      :points => 12,
      :rebounds => 12,
      :assists => 12,
      :steals => 12,
      :blocks => 12,
      :slam_dunks => 7
    },
    "Brook Lopez" => {
      :number => 11,
      :shoe => 17,
      :points => 17,
      :rebounds => 19,
      :assists => 10,
      :steals => 3,
      :blocks => 1,
      :slam_dunks => 15
    },
    "Mason Plumlee" => {
      :number => 1,
      :shoe => 19,
      :points => 26,
      :rebounds => 12,
      :assists => 6,
      :steals => 3,
      :blocks => 8,
      :slam_dunks => 5
    },
    "Jason Terry" => {
      :number => 31,
      :shoe => 15,
      :points => 19,
      :rebounds => 2,
      :assists => 2,
      :steals => 4,
      :blocks => 11,
      :slam_dunks => 1
    }
  }
},

  :away => {
    :team_name => "Charlotte Hornets",
    :colors => ["Turquoise","Purple"],
    :players => {
      "Jeff Adrien" => {
        :number => 4,
        :shoe => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
      },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
      },
      "DeSagna Diop" => {
        :number => 2,
        :shoe => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
      },
      "Ben Gordon" => {
        :number => 8,
        :shoe => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
      },
      "Brendan Haywood" => {
        :number => 33,
        :shoe => 15,
        :points => 6,
        :rebounds => 12,
        :assists => 12,
        :steals => 22,
        :blocks => 5,
        :slam_dunks => 12
      }
    }
  }
}
end 

def num_points_scored(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:points]
 else
   game_hash[:away][:players].include?(player)
   game_hash[:away][:players][player][:points]
  end
end

def shoe_size(player)
  if game_hash[:home][:players].include?(player)
    game_hash[:home][:players][player][:shoe]
  else
    game_hash[:away][:players].include?(player)
    game_hash[:away][:players][player][:shoe]
  end
end

def team_colors(team)
  if team == "Brooklyn Nets"
    game_hash[:home][:colors].to_a
  else
    game_hash[:away][:colors].to_a
  end
end

def team_names
  array = []
  array << game_hash[:home][:team_name]
  array << game_hash[:away][:team_name]
end 
  

def player_numbers(team)
  jersey_nums = []
  if game_hash[:home][:team_name] == team
    game_hash[:home][:players].each do |player, stats|
      stats.each do |k, v|
        if k == :number
          jersey_nums << v
        end
      end
    end
  else
    game_hash[:away][:players].each do |player, stats|
      stats.each do |k, v|
        if k == :number
          jersey_nums << v
        end
      end
    end
  end
  jersey_nums
end
    
def player_stats(name)
  player_stats = nil 
  game_hash.each do |team, team_info|
    team_info.each do |data_key, data|
      if data_key == :players
        data.each do |player, stats|
          if player == name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end

def big_shoe_rebounds
  biggest_shoe = nil
  biggest_shoe_rebounds = nil
  game_hash.each do |team, team_info|
    team_info.each do |data_key, data|
      if data_key == :players
        data.each do |player, stats|
          stats.each do |stat_key, value|
            if stat_key == :shoe
              if biggest_shoe == nil
                 biggest_shoe = value
                 biggest_shoe_rebounds = game_hash[team][:players][player][:rebounds]
              elsif value > biggest_shoe
                biggest_shoe = value
                biggest_shoe_rebounds = game_hash[team][:players][player][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  biggest_shoe_rebounds
end
