#
#  ScoresView.rb
#  springz
#
#  Created by Thomas R. Koll on 26.03.11.
#  Copyright 2011 Ananasblau.com. All rights reserved.
#

class ScoresView < NSView
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
    #    gradient = NSGradient.alloc.initWithColors([NSColor.grayColor, NSColor.blackColor])
    NSColor.grayColor.set
    NSRectFill(rect)

    return if game.players.empty?
    width = (rect.size.width) / game.players.size
    pos_y = 5

    font = NSFont.fontWithName("Helvetica", size:20)
    attributes = {NSFontAttributeName => font, NSForegroundColorAttributeName => NSColor.whiteColor}
    
    shadow = NSShadow.alloc.init
    game.players.each_with_index do |player, index|
      if player == game.current_player
        NSColor.greenColor.colorWithAlphaComponent(0.05).set
        NSRectFill(NSRect.new([width*index+3, 3], [width-6, rect.size.height-6]))
      end
      withContext do
        shadow.shadowOffset = [2, -2]
        shadow.set
        player.name.drawAtPoint([width*index+10, pos_y],
                          withAttributes: attributes)
        player.score.to_s.drawAtPoint([(width*(index+1)-45), pos_y],
                                      withAttributes: attributes)
        # TODO NSRightTextAlignment
      end
    end
  end
end
