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

    background = love.graphics.newImage("sprites/background.png")

end



function love.update(dt)
    if player.isDead then
        cam:zoom(3)
        return 
    end
    Input.playerInputs()---cargar controles
    Physics.playerControl()----cargar movimiento jugador
    Physics.colisionPlayerScreen(player)---detectar que el jugador no se salga de la pantalla

    Variables.drawPlayerLife()
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

    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    -- Dibujar la imagen del fondo escalada para cubrir toda la pantalla
    cam:attach()
        love.graphics.draw(background, 0, 0, 0, screenWidth / background:getWidth(), screenHeight / background:getHeight())
        love.graphics.draw(player.imageActual,player.x,player.y)
        love.graphics.draw(player.imageGun,player.x+20+player.gunToogleX,player.y+10)
        -- love.graphics.draw(player.image, love.mouse.getPosition())
        Enemies.drawEnemies()
        Proyectiles.drawProyectiles()
    cam:detach()
    if player.isDead ==false then
        Variables.drawPlayerLife()
        Variables.drawPlayerMana()
    else
        love.graphics.printf("ESTAS MUERTO", 0, screenHeight / 2 - 10, screenWidth, "center")
    end
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