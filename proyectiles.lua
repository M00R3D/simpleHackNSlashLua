-- proyectiles.lua
local Proyectiles = {}
local Physics = require("physics")

function Proyectiles.createProyectil(x, y, directionX, directionY)
    local proyectil = {
        x = x,
        y = y,
        width = 10,  -- ajusta el ancho según tus necesidades
        height = 5,  -- ajusta el alto según tus necesidades
        speed = 500,  -- ajusta la velocidad según tus necesidades
        directionX = directionX,  -- dirección X del proyectil
        directionY = directionY,  -- dirección Y del proyectil
        image = love.graphics.newImage("sprites/sprite_proyectil.png"),  -- ajusta la ruta de la imagen
        destroyed = false
    }
    table.insert(balas, proyectil)
end
function Proyectiles.updateProyectiles(dt)
    for i, proyectil in ipairs(balas) do
        if not proyectil.destroyed then
            proyectil.x = proyectil.x + proyectil.speed * proyectil.directionX * dt
            proyectil.y = proyectil.y + proyectil.speed * proyectil.directionY * dt

            proyectil.speed=proyectil.speed*1.5
            -- Verificar colisión con límites
            if proyectil.x < 0 or proyectil.x > love.graphics.getWidth() or
               proyectil.y < 0 or proyectil.y > love.graphics.getHeight() then
                proyectil.destroyed = true
            end

            -- Verificar colisión con enemigos
            for j, enemy in ipairs(enemies) do
                if Physics.checkCollision(proyectil, enemy) then
                    proyectil.destroyed = true
                    -- Aquí podrías añadir lógica adicional al colisionar con un enemigo
                    -- Por ejemplo, reducir la vida del enemigo, etc.
                end
            end
        end
    end

    -- Limpiar proyectiles destruidos
    for i = #balas, 1, -1 do
        if balas[i].destroyed then
            table.remove(balas, i)
        end
    end
end


function Proyectiles.drawProyectiles()
    for i, proyectil in ipairs(balas) do
        -- Calcular el ángulo de rotación del proyectil
        local angle = math.atan2(proyectil.directionY, proyectil.directionX)
        
        -- Dibujar el proyectil con rotación
        love.graphics.draw(proyectil.image, proyectil.x, proyectil.y, angle, 1, 1, proyectil.image:getWidth() / 2, proyectil.image:getHeight() / 2)
    end
end


return Proyectiles
