--[[
    @author Marcio Andrey Oliveira
    @copyright 2019
    @see https://wiki.giderosmobile.com/index.php/Stage
    @see https://wiki.giderosmobile.com/index.php/Bitmap
    @see https://wiki.giderosmobile.com/index.php/Event
    
    
    Properties set: 
        - Logical Dimensions: 800x600 px (Width x Height).
        - Scale mode: Letterbox.
        - Orientation: Landscape Left.
    
    Note: You have to set Gideros player to use Landscape Left orientation.
          In player go to menu Hardware -> Orientation Landscape Left.
--]]


--[[
    Touch events meant for mobile devices and allow us to handle single
    and multi touches. On the other hand, mouse events meant for desktops
    but you can use them to handle single touchs in mobiles too.
--]]

-- A simple function to handle touch events.
local function touched(obj, event)
    if obj:hitTestPoint(event.touch.x, event.touch.y) then
        local x = event.touch.x
        local y = event.touch.y
        print('touched: X = ' .. x .. ' Y = ' .. y)
    end
end

-- A simple function to handle mouse events.
local function clicked(obj, event)
    local x = event.x
    local y = event.y
    print('clicked: X = ' .. x .. ' Y = ' .. y)
end


-- Create a Bitmap object. Note that we are passing to its constructor 
-- a Texture object and that it receives the full path of the image as
-- we see under Files folder
local einstein = Bitmap.new(Texture.new('ra_einstein.png'))

-- put it at position x = 80, y = 0.
einstein:setPosition(80, 0)

-- You need to listen to events of your interest. You can pick just 
-- what you need in your game. I'm adding both types of events for
-- the sake of demonstration.
einstein:addEventListener(Event.TOUCHES_END, touched, einstein)
einstein:addEventListener(Event.MOUSE_UP, clicked, einstein)

-- add it to stage. It os a global variable of type Stage. You never instantiate it yourself.
stage:addChild(einstein)

