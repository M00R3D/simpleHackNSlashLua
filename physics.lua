--physics.lua
local Physics={}
    function Physics.colisionPlayer(player)
        if player.x<0 then    player.x=0 end
        if player.y<0 then    player.y=0 end
        if player.x>(love.graphics.getWidth() - player.width) then    player.x=love.graphics.getWidth() - player.width
        end
        if player.y>(love.graphics.getHeight() - player.height) then    player.y=love.graphics.getHeight()- player.height
        end 
    end

    function Physics.checkCollision(rect1, rect2)
        return rect1.x < rect2.x + rect2.width and
               rect1.x + rect1.width > rect2.x and
               rect1.y < rect2.y + rect2.height and
               rect1.y + rect1.height > rect2.y
    end

    return Physics