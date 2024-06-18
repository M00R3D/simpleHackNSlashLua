--variables.lua
local Variables = {}
local PlayerStart = require("playerStart")

function Variables.init()
    k_w = false
    k_a = false
    k_s = false
    k_d = false
    clk = false
    enemies = {}
    balas={}
    PlayerStart.createPlayer()
    enemyCounter = 0
    enemyTime = 240
end




---------------logica animacion del personaje-------------
function Variables.playerAnimator(dt)
    if k_a == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_right.png")
        player.gunToogleX = -30
    elseif k_d == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_left.png")
        player.gunToogleX = 0
    end

    playerSprTime = playerSprTime + dt
    
    if playerSprTime > 0.2 then
        playerSprTime = 0
        if player.imageActual == player.image0 then 
            player.imageActual = player.image1 
        elseif player.imageActual == player.image1 then 
            player.imageActual = player.image2 
        elseif player.imageActual == player.image2 then 
            player.imageActual = player.image3 
        else
            player.imageActual = player.image0 
        end
    end
end
---------------logica animacion del personaje-------------


-- Funcion para dañar al personaje
function Variables.damagePlayer(damage)
    player.life = player.life - damage
    if player.life <= 0 then
        player.life = 0
        -- Aquí puedes agregar lógica adicional para manejar la muerte del personaje.
        print("El personaje ha muerto")
    else
        print("El personaje ha recibido daño. Vida restante: " .. player.life)
    end
end

function Variables.drawPlayerLife()
    love.graphics.print("Vida: " .. player.life, 10, 10)
end

return Variables
