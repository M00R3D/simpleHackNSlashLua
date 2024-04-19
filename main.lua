local Input = require("input")
local Enemies = require("enemies")
local Physics = require("physics")
local Variables = require("variables")
local Proyectiles = require("proyectiles")

function love.load()
    Variables.init()
   
end



function love.update(dt)
    Input.playerInputs()
    Physics.playerControl()
    Physics.colisionPlayer(player)
    enemyTime=enemyTime-1
    Enemies.updateEnemies(dt)
    Variables.playerAnimator(dt)
    Proyectiles.updateProyectiles(dt)
    if enemyTime==0 then
        enemyTime=240
        if enemyCounter<11 then
            Enemies.createEnemy(200,130)
            enemyCounter=enemyCounter+1
        end
    end

    
end

function love.draw()
    love.graphics.draw(player.imageActual,player.x,player.y)
    love.graphics.draw(player.imageGun,player.x+20+player.gunToogleX,player.y+10)
    -- love.graphics.draw(player.image, love.mouse.getPosition())
    Enemies.drawEnemies()
    Proyectiles.drawProyectiles()
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- Calcular el ángulo entre el jugador y el mouse
        local angle = math.atan2(y - player.y, x - player.x)
        
        -- Calcular direcciones X y Y a partir del ángulo
        local directionX = math.cos(angle)
        local directionY = math.sin(angle)

        -- Crear un proyectil en la posición del jugador
        Proyectiles.createProyectil(player.x + 20, player.y + 10, directionX, directionY)
    end
end

--     function love.mousereleased(x, y, button)

--     end

-- function love.quit()

-- end