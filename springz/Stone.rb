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
  attr_accessor :position

  def initialize(position, color = NSColor.whiteColor, size = 10)
    self.color = color
    self.size = size
    self.position = position
  end

  def self.new_with_distribution(rect, others, color = NSColor.whiteColor, size = 10)
    c = 0
    begin
      c+= 1
      pos = NSPoint.new(rand(rect.frame.size.width - 2*size) + size, rand(rect.frame.size.height - 2*size) + size)
    end while c < 10 && others.find{|o| o.distance(pos) < (o.size + size) }
    return self.new(pos, color, size)
  end
                                               
  def rect
    rect = NSRect.new
    rect.origin.x = position.x - size
    rect.origin.y = position.y - size
    rect.size.width  = 2 * size
    rect.size.height = 2 * size
    rect
  end

  def rect_for_knob
    knob_size = [10, size/3*2].min
    rect = NSRect.new
    rect.origin.x = position.x - knob_size/2
    rect.origin.y = position.y - knob_size/2
    rect.size.width  = knob_size
    rect.size.height = knob_size
    rect
  end

  def distance(other)
    # all circles, easy peasy :)
    Math.sqrt((other.x - position.x)**2 + (other.y.to_f - position.y)**2)
  end
  def hit?(point)
    distance(point) < size
  end
end
