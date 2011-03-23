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
  
  def awakeFromNib
    stones << Stone.new
  end
end


