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
    return if game.players.empty?
    width = (rect.size.width-20) / game.players.size


    withContext do
      font = NSFont.fontWithName("Helvetica", size:24)
      attributes = {NSFontAttributeName => font, NSForegroundColorAttributeName => NSColor.whiteColor}
      
      shadow = NSShadow.alloc.init
      shadow.shadowOffset = [4, -4]
      shadow.set
      game.players.each_with_index do |player, index|
        player.name.drawAtPoint([width*index+10, rect.size.height/3],
                          withAttributes: attributes)
        player.score.to_s.drawAtPoint([(width*(index+1)-30), rect.size.height/3],
                                      withAttributes: attributes)
        # TODO draw player name and score
      end
    end
  end
end
