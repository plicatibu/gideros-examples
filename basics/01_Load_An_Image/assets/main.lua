--[[
    @author Marcio Andrey Oliveira
    @copyright 2019
    @see https://wiki.giderosmobile.com/index.php/Stage
    @see https://wiki.giderosmobile.com/index.php/Bitmap
    
    
    Properties set: 
        - Logical Dimensions: 800x600 px (Width x Height).
        - Scale mode: Letterbox.
        - Orientation: Landscape Left.
    
    Note: You have to set Gideros player to use Landscape Left orientation.
          In player go to menu Hardware -> Orientation Landscape Left.
--]]


-- Create a Bitmap object. Note that we are passing to its constructor 
-- a Texture object and that it receives the full path of the image as
-- we see under Files folder
local einstein = Bitmap.new(Texture.new('ra_einstein.png'))

-- put it at position x = 80, y = 0.
einstein:setPosition(80, 0)

-- add it to stage. It os a global variable of type Stage. You never instantiate it yourself.
stage:addChild(einstein)

-- You can make image transparent (50% is our example).
einstein:setAlpha(0.5)

-- Lets rotate image 14 degrees.
einstein:setRotation(14)
--sprite:addChild(einstein)
