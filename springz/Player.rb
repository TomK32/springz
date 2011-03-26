#
#  Player.rb
#  springz
#
#  Created by Thomas R. Koll on 26.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#


class Player
  attr_accessor :score
  attr_accessor :name

  def initialize(name)
    self.name = name
    self.score = 0
  end

  def increase_score(n = 1)
    self.score += n
  end
end