#
#  SpringzGameController.rb
#  springz
#
#  Created by Thomas R. Koll on 23.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#
class SpringzGameController
  attr_accessor :game_view
  attr_accessor :stones
  attr_accessor :players
  attr_accessor :current_player
  attr_accessor :scores
  
  def awakeFromNib
    start_game(nil)
  end

  def remove_stones(point)
    game_view.setNeedsDisplay true
    scores.setNeedsDisplay true

    hits = stones.select{|stone| stone.hit?(point) }
    # TODO
    next_player and return if hits.empty?
    self.stones -= hits
    current_player.increment_score(hits.collect(&:size).inject{|sum,n| sum+=n })
  end
  
  def next_player
    self.current_player = self.players[(1+self.players.index(current_player)) % players.size]
  end
  
  def start_game(sender)
    puts "starting new game"
    self.players = [Player.new('Player 1'), Player.new('Player 2'), Player.new('Thomas')]
    self.current_player = self.players.first
    self.stones = []
    5.times { self.stones << Stone.new_with_distribution(game_view, self.stones, NSColor.yellowColor, 10) }
    5.times { self.stones << Stone.new_with_distribution(game_view, self.stones, NSColor.blueColor, 20) }
    5.times { self.stones << Stone.new_with_distribution(game_view, self.stones, NSColor.redColor, 30) }
    game_view.setNeedsDisplay true
    scores.setNeedsDisplay true
  end
end


