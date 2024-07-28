local Input = require("input")
local Enemies = require("enemies")
local Physics = require("physics")
local Variables = require("variables")
local Proyectiles = require("proyectiles")
local Camera = require("camera")

function love.load()
    Variables.init()
    cam = Camera()
    cam:zoom(2.4)

    background = love.graphics.newImage("sprites/background.png")
end

function love.update(dt)
    if player.isDead then
        cam:zoom(3)
        return
    end

    Input.playerInputs()
    Physics.playerControl()
    Physics.colisionPlayerScreen(player)
    Variables.drawPlayerLife()

    enemyTime = enemyTime - 1

    Enemies.updateEnemies(dt)  -- Actualiza enemigos y XP
    Enemies.updateXp(dt)
    Variables.playerAnimator(dt)
    Proyectiles.updateProyectiles(dt)

    -- Spawner de enemigos
    if enemyTime == 0 then
        enemyTime = 240
        if enemyCounter < 11 then
            Enemies.createEnemy(200, 130)
            enemyCounter = enemyCounter + 1
        end
    end

    cam:lookAt(player.x, player.y)

    local w = love.graphics.getWidth()
    local h = love.graphics.getHeight()

    if cam.x < w / 3 then
        cam.x = w / 3
    end
    if cam.y < h / 3 then
        cam.y = h / 3
    end
end


function love.draw()
    local screenWidth = love.graphics.getWidth()
    local screenHeight = love.graphics.getHeight()

    -- Dibujar la imagen del fondo escalada para cubrir toda la pantalla
    cam:attach()
        love.graphics.draw(background, 0, 0, 0, screenWidth / background:getWidth(), screenHeight / background:getHeight())
        love.graphics.draw(player.imageActual, player.x, player.y)
        love.graphics.draw(player.imageGun, player.x + 20 + player.gunToogleX, player.y + 10)
        Enemies.drawEnemies()
        Enemies.drawXp()
        Proyectiles.drawProyectiles()
    cam:detach()

    if not player.isDead then
        Variables.drawPlayerLife()
        Variables.drawPlayerMana()
        Variables.drawPlayerExp()
    else
        love.graphics.printf("ESTÁS MUERTO", 0, screenHeight / 2 - 10, screenWidth, "center")
    end
end

function love.mousepressed(x, y, button)
    if button == 1 then
        -- Convertir las coordenadas del mouse a las coordenadas del mundo
        local worldX, worldY = cam:worldCoords(x, y)

        -- Calcular el ángulo entre el jugador y el mouse
        local angle = math.atan2(worldY - player.y, worldX - player.x)

        -- Calcular direcciones X y Y a partir del ángulo
        local directionX = math.cos(angle)
        local directionY = math.sin(angle)

        -- Crear un proyectil en la posición del jugador
        Proyectiles.createProyectil(player.x + 20, player.y + 10, directionX, directionY)
    end
end
