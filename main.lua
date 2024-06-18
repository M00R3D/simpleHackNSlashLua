local Input = require("input")
local Enemies = require("enemies")
local Physics = require("physics")
local Variables = require("variables")
local Proyectiles = require("proyectiles")
local Camera = require("camera")

function love.load()
    Variables.init()
    cam = Camera()
    cam:zoom(1.4)
end



function love.update(dt)
    Input.playerInputs()---cargar controles
    Physics.playerControl()----cargar movimiento jugador
    Physics.colisionPlayerScreen(player)---detectar que el jugador no se salga de la pantalla
    
    enemyTime=enemyTime-1   ----se reduce el temporizador de spawnerde enemigos
    
    Enemies.updateEnemies(dt)------ movimiento de los enemigos y colisionar
    Variables.playerAnimator(dt)---logica animacion del personaje
    Proyectiles.updateProyectiles(dt)---- mover proyectiles y colisionar
    ----------------spawner de enemigos----------------------------
    if enemyTime==0 then
        enemyTime=240
        if enemyCounter<11 then
            Enemies.createEnemy(200,130)
            enemyCounter=enemyCounter+1
        end
    end
    ----------------spawner de enemigos----------------------------
    cam:lookAt(player.x,player.y)
    
    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x< w/2 then
        cam.x = w/2
    end
    if cam.y< h/2 then
        cam.y = h/2
    end
end

function love.draw()
    Variables.drawPlayerLife()

    cam:attach()
        love.graphics.draw(player.imageActual,player.x,player.y)
        love.graphics.draw(player.imageGun,player.x+20+player.gunToogleX,player.y+10)
        -- love.graphics.draw(player.image, love.mouse.getPosition())
        Enemies.drawEnemies()
        Proyectiles.drawProyectiles()
    cam:detach()
    
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