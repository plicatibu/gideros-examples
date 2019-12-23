--[[
    @author Marcio Andrey Oliveira
    @copyright 2019
    @see https://wiki.giderosmobile.com/index.php/Stage
    @see https://wiki.giderosmobile.com/index.php/Sprite
    @see https://wiki.giderosmobile.com/index.php/Bitmap


    Properties set:
        - Logical Dimensions: 320x480 px (Width x Height).
        - Scale mode: No scale - top left.
        - Orientation: Landscape Left.

    Note: You have to set Gideros player to use Landscape Left orientation.
          In player go to menu Hardware -> Orientation Landscape Left.

          This post is a simplified form of code created by user rrraptor (http://forum.giderosmobile.com/profile/rrraptor)
          from Gideros forum. All kudos go to him. You can see the original source code here:
          http://forum.giderosmobile.com/discussion/7919/how-to-make-a-bitmap-follow-mouse
--]]


-- Below there are 2 auxiliary functions

function Distance(x1,y1, x2,y2)
	return (x2-x1)^2+(y2-y1)^2
end

function Lerp(a, b, t)
	return a + t * (b - a)
end


-- In order to encapsulate the of following the mouse, we are
-- going to create class FollowSprite that is derived from Sprite class.


-- Pay attention to line below. It shows you how to extend a class in Gideros.
FollowSprite = Core.class(Sprite)

-- init() method is the constructor of our class. It will be called when one
-- instantiates FollowSprite (it's done by calling function new()).
--
-- speed parameter adjusts how fast sprite will follow mouse.
-- distance parameter sets how far from mouse sprite will be.
-- texture expects the 

function FollowSprite:init(speed, distance, image)
	self.bmp = Bitmap.new(Texture.new(image))
	self.bmp:setAnchorPoint(.5,.5)
	self:addChild(self.bmp)
	self.tx = 0
	self.ty = 0
	self.speed = speed
	self.dist = distance
end

function FollowSprite:follow(x, y)
	self.tx = x
	self.ty = y
end

function FollowSprite:update(dt)
	local x, y = self:getPosition()
	local distSq = Distance(x, y, self.tx, self.ty)

	if (distSq > self.dist^2) then
		local t = 0.1
		x = Lerp(x, self.tx, t)
		y = Lerp(y, self.ty, t)
		self:setPosition(x, y)
	end
end

-- Here we instantiate FollowSprite. Note that it calls init().
local obj = FollowSprite.new(300, 20, 'gideros.png')

stage:addChild(obj)

-- On ENTER_FRAME event we update sprite's position.
stage:addEventListener(Event.ENTER_FRAME, function(e)
	local dt = e.deltaTime
	obj:update(dt)
end)

-- On MOUSE_HOVER event, we update sprite position when mouse moves.
stage:addEventListener(Event.MOUSE_HOVER, function(e)
	obj:follow(e.x, e.y)
end)
