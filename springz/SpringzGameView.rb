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

  def withContext(&block)
    context = NSGraphicsContext.currentContext
    context.saveGraphicsState
    yield
    context.restoreGraphicsState
  end

  def drawRect rect
    NSColor.brownColor.set
    NSRectFill(bounds)
    self.game.stones.each do |stone|
      withContext do
        stone.color.set
        NSBezierPath.bezierPathWithOvalInRect(stone.rect).fill
        NSColor.blackColor.colorWithAlphaComponent(0.5).set
        NSBezierPath.bezierPathWithOvalInRect(stone.rect_for_knob).fill
      end
    end
  end



  def mouseUp event
    point = convertPoint event.locationInWindow, fromView:nil
    game.remove_stones(point)
  end
end