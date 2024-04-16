--input.lua
local Input = {}

function Input.playerInputs()
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
