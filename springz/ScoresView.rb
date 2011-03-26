#
#  ScoresView.rb
#  springz
#
#  Created by Thomas R. Koll on 26.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#

class ScoresView < NSView
  attr_accessor :game

  def drawRect rect
    game.players.each do |player|
      # TODO draw player name and score
    end
  end
end
