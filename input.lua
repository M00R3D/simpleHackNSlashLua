local Variables = require("variables")
local Input = {}

function Input.playerInputs()
    -- Esta función puede manejar cualquier lógica adicional de entrada, si es necesario
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
    elseif key == "r" and player.isDead then
        Variables.init() -- Reinicia las variables del juego
        cam:zoom(2.4) -- Restablece la cámara al zoom inicial
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

return Input
