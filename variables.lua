--variables.lua
local Variables = {}
local PlayerStart = require("playerStart")
local Camera = require("camera")

function Variables.init()
    k_w = false
    k_a = false
    k_s = false
    k_d = false
    clk = false
    enemies = {}
    balas = {}
    PlayerStart.createPlayer()
    enemyCounter = 0
    enemyTime = 240
    cam = Camera()
    cam:lookAt(player.x, player.y) -- Centrar la cámara en el jugador
end


---------------logica animacion del personaje-------------
function Variables.playerAnimator(dt)
    if k_a == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_right.png")
        player.gunToogleX = -30
        side="left"
    elseif k_d == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_left.png")
        player.gunToogleX = 0
        side="right"
    end
    if side=="right"
    then
        
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
    if player.isDead then
        return
    end

    player.life = player.life - damage
    if player.life <= 0 then
        player.life = 0
        player.isDead = true
        print("El personaje ha muerto")
        -- Aquí puedes agregar lógica adicional para manejar la muerte del personaje.
    else
        print("El personaje ha recibido daño. Vida restante: " .. player.life)
    end
end
function Variables.drawPlayerLife()
    local x = 20  -- Posición X de la barra de vida
    local y = 20  -- Posición Y de la barra de vida
    local width = 200  -- Ancho de la barra de vida
    local height = 20  -- Altura de la barra de vida

    -- Calcula la longitud de la barra de vida en función de player.life y player.maxLife
    local lifeRatio = player.life / player.maxLife
    local barWidth = width * lifeRatio

    -- Dibuja el contorno de la barra de vida
    love.graphics.setColor(255, 255, 255)  -- Color blanco para el contorno
    love.graphics.rectangle('line', x, y, width, height)

    -- Dibuja el relleno de la barra de vida en color verde si es mayor a 50%, rojo si es menor
    if lifeRatio > 0.5 then
        love.graphics.setColor(0, 255, 0)  -- Verde
    else
        love.graphics.setColor(255, 0, 0)  -- Rojo
    end
    love.graphics.rectangle('fill', x, y, barWidth, height)
    love.graphics.setColor(255, 255, 255)  -- Rojo

end
function Variables.drawPlayerExp()
    local x = 20  -- Posición X de la barra de experiencia
    local y = 80  -- Posición Y de la barra de experiencia
    local width = 200  -- Ancho de la barra de experiencia
    local height = 20  -- Altura de la barra de experiencia

    -- Calcula la longitud de la barra de experiencia en función de player.exp y player.maxExp
    local expRatio = player.exp / player.maxExp
    local barWidth = width * expRatio

    -- Dibuja el contorno de la barra de experiencia
    love.graphics.setColor(255, 255, 255)  -- Color blanco para el contorno
    love.graphics.rectangle('line', x, y, width, height)

    -- Dibuja el relleno de la barra de experiencia en color verde
    love.graphics.setColor(0, 255, 0)  -- Verde
    love.graphics.rectangle('fill', x, y, barWidth, height)

    -- Restablece el color para que no afecte a otros dibujos
    love.graphics.setColor(255, 255, 255)
end

function Variables.drawPlayerMana()
    local x = 20  -- Posición X de la barra de vida
    local y = 50  -- Posición Y de la barra de vida
    local width = 200  -- Ancho de la barra de vida
    local height = 20  -- Altura de la barra de vida

    -- Calcula la longitud de la barra de vida en función de player.life y player.maxLife
    local manaRatio = player.mana / player.maxMana
    local barWidth = width * manaRatio

    -- Dibuja el contorno de la barra de vida
    love.graphics.setColor(255, 255, 255)  -- Color blanco para el contorno
    love.graphics.rectangle('line', x, y, width, height)

    -- Dibuja el relleno de la barra de vida en color verde si es mayor a 50%, rojo si es menor
    if manaRatio > 0.5 then
        love.graphics.setColor(0, 0, 255)  -- Verde
    else
        love.graphics.setColor(0, 0, 0)  -- Rojo
    end
    love.graphics.rectangle('fill', x, y, barWidth, height)
    love.graphics.setColor(255, 255, 255)  -- Rojo

end
return Variables
