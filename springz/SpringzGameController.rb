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
  attr_accessor :scores
  
  def awakeFromNib
    self.stones ||= []
    self.players ||= [Player.new('Player 1'), Player.new('Player 2')]
    self.stones << Stone.new
  end
end


