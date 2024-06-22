--enemies.lua
local Variables = require("variables")
local Physics = require("physics")
-----------------creacion de arreglo de enemigos----------------------------
local Enemies={}
-----------------creacion de arreglo de enemigos----------------------------


-----------------creacion de un enemigo----------------------------
    function Enemies.createEnemy(x, y)
        enemy = 
        {
            image = love.graphics.newImage("sprites/sprite_enemy_a/sprite_enemy_a0.png"),
            x=x,
            y=y,
            width=30,
            height=30,
            speed=2,
            life=3
        }    
        table.insert( enemies, enemy )
    end
-----------------creacion de un enemigo----------------------------



-----------------dibujar todo el arreglo de enemigos----------------------------
    function Enemies.drawEnemies()
        for i, enemy in ipairs(enemies) do
            love.graphics.draw(enemy.image, enemy.x, enemy.y)
        end
    end
-----------------dibujar todo el arreglo de enemigos----------------------------


----movimiento
    function Enemies.updateEnemies(dt)
        for i, enemy in ipairs(enemies) do
            -- Manejar la colisión con otros enemigos
            for j, otherEnemy in ipairs(enemies) do
                if i ~= j and Physics.checkCollision(enemy, otherEnemy) then
                    -- Aplicar movimiento opuesto
                    if enemy.x < otherEnemy.x then
                        enemy.x = enemy.x - enemy.speed
                    elseif enemy.x > otherEnemy.x then
                        enemy.x = enemy.x + enemy.speed
                    end
                    if enemy.y < otherEnemy.y then
                        enemy.y = enemy.y - enemy.speed
                    elseif enemy.y > otherEnemy.y then
                        enemy.y = enemy.y + enemy.speed
                    end
                end
            end
            -- Manejar la colisión con el jugador
            if Physics.checkCollision(player, enemy) then
                -- Aplicar rebote suave al jugador
                local dx = player.x - enemy.x
                local dy = player.y - enemy.y
                local distance = math.sqrt(dx*dx + dy*dy)
                local penetration = player.width/2 + enemy.width/2 - distance
                local normalX = dx / distance
                local normalY = dy / distance
                player.x = player.x + normalX * penetration * 0.5
                player.y = player.y + normalY * penetration * 0.5
                Variables.damagePlayer(3)
            end
            -- Mover a los enemigos según su dirección
            -- Esto debería estar fuera del bucle de colisión para evitar movimientos adicionales
            -- causados por la detección de colisiones.
            if enemy.x < player.x then
                enemy.x = enemy.x + enemy.speed
            elseif enemy.x > player.x then
                enemy.x = enemy.x - enemy.speed
            end
            if enemy.y < player.y then
                enemy.y = enemy.y + enemy.speed
            elseif enemy.y > player.y then
                enemy.y = enemy.y - enemy.speed
            end
        end
    end
    

    
return Enemies