#
#  Stone.rb
#  springz
#
#  Created by Thomas R. Koll on 23.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#

class Stone
  attr_accessor :color
  attr_accessor :size
  attr_accessor :lng
  attr_accessor :lat

  def initialize(position = [0,0], color = NSColor.whiteColor, size = 10)
    self.color = color
    self.size = size
    self.lng, self.lat = position
  end

  def rect
    rect = NSRect.new
    rect.origin.x = lat - size
    rect.origin.y = lng - size
    rect.size.width  = 2 * size
    rect.size.height = 2 * size
    rect
  end

  def rect_for_knob
    knob_size = [10, size/3*2].min
    rect = NSRect.new
    rect.origin.x = lat - knob_size/2
    rect.origin.y = lng - knob_size/2
    rect.size.width  = knob_size
    rect.size.height = knob_size
    rect
  end

  def distance(other)
    # all circles, easy peasy :)
    Math.sqrt((other.x - lat)**2 + (other.y.to_f - lng)**2)
  end
  def hit?(point)
    distance(point) < size
  end
end
