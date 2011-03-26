#
#  Stone.rb
#  springz
#
#  Created by Thomas R. Koll on 23.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#

class Stone
  attr_accessor :color
  attr_accessor :lng
  attr_accessor :lat
  
  def new
    
  end
  
  def drawRect rect
    
    dotRect = NSRect.new
    dotRect.origin.x = @center.x - @radius
    dotRect.origin.y = @center.y - @radius
    dotRect.size.width  = 2 * @radius
    dotRect.size.height = 2 * @radius
    
    @color.set
    NSBezierPath.bezierPathWithOvalInRect(dotRect).fill
  end
end
