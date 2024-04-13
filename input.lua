--input.lua
local Input = {}
function Input.playerControl()
    if k_w==true then    player.y=player.y-(1*player.speed)
    end
    if k_a==true then     player.x=player.x-(1*player.speed)
    end
    if k_d==true then    player.x=player.x+(1*player.speed)
    end
    if k_s==true then    player.y=player.y+(1*player.speed)
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

end
return Input