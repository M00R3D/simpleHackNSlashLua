function love.load()
    player = 
    {
        x=30,
        y=30,
        width=40,
        height=40,
        speed=3
    }
    k_w= false;k_a= false;k_s= false;k_d= false
end

function love.update(dt)
    if k_w==true then
        player.y=player.y-(1*player.speed)
    end
    if k_a==true then
        player.x=player.x-(1*player.speed)
    end
    if k_d==true then
        player.x=player.x+(1*player.speed)
    end
    if k_s==true then
        player.y=player.y+(1*player.speed)
    end

    if player.x<0 then
        player.x=0
    end
    if player.y<0 then
        player.y=0
    end
    if player.x>(love.graphics.getWidth() - player.width) then
        player.x=love.graphics.getWidth() - player.width
    end
    if player.y>(love.graphics.getHeight() - player.height) then
        player.y=love.graphics.getHeight()- player.height
    end
end

function love.draw()
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
end

    function love.keypressed(key)
        if key == "w" then
            k_w = true
        elseif key == "a" then
            k_a = true
        elseif key == "s" then
            k_s = true
        elseif key == "d" then
            k_d = true
        end
    end

    function love.keyreleased(key)
        if key == "w" then
            k_w = false
        elseif key == "a" then
            k_a = false
        elseif key == "s" then
            k_s = false
        elseif key == "d" then
            k_d = false
        end
    end

    function love.mousepressed(x, y, button)

    end

    function love.mousereleased(x, y, button)

    end

function love.quit()

end