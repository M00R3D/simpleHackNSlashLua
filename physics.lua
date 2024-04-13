local Physics={}
    function Physics.colisionPlayer(player)
        if player.x<0 then    player.x=0 end
        if player.y<0 then    player.y=0 end
        if player.x>(love.graphics.getWidth() - player.width) then    player.x=love.graphics.getWidth() - player.width
        end
        if player.y>(love.graphics.getHeight() - player.height) then    player.y=love.graphics.getHeight()- player.height
        end 
    end

    return Physics