local Proyectiles = {}
local Physics = require("physics")
local Enemies = require("enemies")

local balas = {}  -- Inicializa la tabla de balas

function Proyectiles.createProyectil(x, y, directionX, directionY)
    local proyectil = {
        x = x,
        y = y,
        width = 10,
        height = 5,
        speed = 500,
        directionX = directionX,
        directionY = directionY,
        image = love.graphics.newImage("sprites/sprite_proyectil.png"),
        destroyed = false,
        dmg = 5
    }
    table.insert(balas, proyectil)
end

function Proyectiles.updateProyectiles(dt)
    for i = #balas, 1, -1 do
        local proyectil = balas[i]
        if not proyectil.destroyed then
            proyectil.x = proyectil.x + proyectil.speed * proyectil.directionX * dt
            proyectil.y = proyectil.y + proyectil.speed * proyectil.directionY * dt

            proyectil.speed = proyectil.speed * 1.5

            -- Verificar colisión con límites
            if proyectil.x < 0 or proyectil.x > love.graphics.getWidth() or
               proyectil.y < 0 or proyectil.y > love.graphics.getHeight() then
                proyectil.destroyed = true
            end

            -- Verificar colisión con enemigos
            for j = #Enemies.enemies, 1, -1 do
                local enemy = Enemies.enemies[j]
                if Physics.checkCollision(proyectil, enemy) then
                    enemy.life = enemy.life - proyectil.dmg
                    proyectil.destroyed = true
                    if enemy.life <= 0 then
                        Enemies.createXp(enemy.x, enemy.y)
                    end
                    break
                end
            end
        end

        -- Limpiar proyectiles destruidos
        if proyectil.destroyed then
            table.remove(balas, i)
        end
    end
end

function Proyectiles.drawProyectiles()
    for _, proyectil in ipairs(balas) do
        local angle = math.atan2(proyectil.directionY, proyectil.directionX)
        love.graphics.draw(proyectil.image, proyectil.x, proyectil.y, angle, 1, 1, proyectil.image:getWidth() / 2, proyectil.image:getHeight() / 2)
    end
end

return Proyectiles
