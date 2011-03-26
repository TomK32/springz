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
    self.players ||= [Player.new('Player 1'), Player.new('Player 2')]
    self.current_player = self.players.first
    self.stones ||= []
    5.times { self.stones << Stone.new(random_position, NSColor.yellowColor, 10) }
    5.times { self.stones << Stone.new(random_position, NSColor.blueColor, 20) }
    5.times { self.stones << Stone.new(random_position, NSColor.redColor, 30) }

  end

  def random_position
    [rand(self.game_view.frame.size.height), rand(self.game_view.frame.size.width)]
  end

  def remove_stones(point)
    hits = stones.select{|stone| stone.hit?(point) }
    next_player and return if hits.empty?
    self.stones -= hits
    current_player.increment_score(hits.collect(&:size).inject{|sum,n| sum+=n })
    game_view.setNeedsDisplay true
    scores.setNeedsDisplay true
  end
  
  def next_player
    self.current_player = self.players[(1+self.players.index(current_player)) % players.size]
  end
end


