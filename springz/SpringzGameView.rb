#
#  SpringzGameView.rb
#  springz
#
#  Created by Thomas R. Koll on 23.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#


class SpringzGameView < NSView
  attr_accessor :game

  def initWithFrame frame
    super(frame)
  end

  def drawRect rect
    NSColor.brownColor.set
    NSBezierPath.fillRect(rect)
  end
  
end