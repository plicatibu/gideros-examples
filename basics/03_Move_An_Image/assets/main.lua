--[[
    @author Marcio Andrey Oliveira
    @copyright 2019
    @see https://wiki.giderosmobile.com/index.php/Stage
    @see https://wiki.giderosmobile.com/index.php/Bitmap
    @see https://wiki.giderosmobile.com/index.php/Event
    @see https://wiki.giderosmobile.com/index.php/LiquidFun
    
    
    Properties set: 
        - Logical Dimensions: 800x600 px (Width x Height).
        - Scale mode: Letterbox.
        - Orientation: Landscape Left.
    
    Note: You have to set Gideros player to use Landscape Left orientation.
          In player go to menu Hardware -> Orientation Landscape Left.
--]]


-- Include box2d library.
require "box2d"


-- Create a Bitmap object. Note that we are passing to its constructor 
-- a Texture object and that it receives the full path of the image as
-- we see under Files folder
local einstein = Bitmap.new(Texture.new('ra_einstein.png'))


-- create box2d physical object
local world = b2.World.new(0, 10, true)


-- Reference center of the einstein for positioning. It is required when using Box2D / LiquidFun.
einstein:setAnchorPoint(0.5,0.5)

--create box2d physical object
local body = world:createBody{type = b2.DYNAMIC_BODY}


-- Let's start animation with einstein hidden. When it appears it will be centered (in relation to y axis).
body:setPosition(-einstein:getWidth(), application:getContentHeight()/2)


-- In order to physics work we have to add the body create above as a property of einstein.
einstein.body = body


-- b2.Body:setGravityScale(0)
body:setGravityScale(0)


-- b2.Body:setLinearVelocity(x,y)
 body:setLinearVelocity(10, 0)


-- Let's update position on each frame. Note we are passing an anonimous function to addEventListener function.
stage:addEventListener(Event.ENTER_FRAME, function()
	-- edit the step values if required. These are good defaults!
    world:step(1/60, 8, 3)
	einstein:setPosition(einstein.body:getPosition())
end)

--add to scene
stage:addChild(einstein)
