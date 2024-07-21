local Variables = require("variables")
local Physics = require("physics")

-----------------creacion de arreglo de enemigos----------------------------
local Enemies = {}
Enemies.enemies = {}  -- Inicializa la tabla de enemigos
Enemies.xps = {}      -- Inicializa la tabla de XP
-----------------creacion de arreglo de enemigos----------------------------

-----------------creacion de un enemigo----------------------------
function Enemies.createEnemy(x, y)
    local enemy = {
        image = love.graphics.newImage("sprites/sprite_enemy_a/sprite_enemy_a0.png"),
        x = x,
        y = y,
        width = 30,
        height = 30,
        speed = 2,
        life = 30,
        destroyed = false
    }    
    table.insert(Enemies.enemies, enemy)
end

function Enemies.createXp(x, y)
    local xp = {
        image = love.graphics.newImage("sprites/Xp.png"),
        x = x,
        y = y,
        width = 30,
        height = 30
    }    
    table.insert(Enemies.xps, xp)
end
-----------------creacion de un enemigo----------------------------

-----------------dibujar todo el arreglo de enemigos----------------------------
function Enemies.drawEnemies()
    for _, enemy in ipairs(Enemies.enemies) do
        love.graphics.draw(enemy.image, enemy.x, enemy.y)
    end
end

function Enemies.drawXp()
    for _, xp in ipairs(Enemies.xps) do
        love.graphics.draw(xp.image, xp.x, xp.y)
    end
end
-----------------dibujar todo el arreglo de enemigos----------------------------

----movimiento
function Enemies.updateXp(dt)
    for i = #Enemies.xps, 1, -1 do
        local xp = Enemies.xps[i]
        if Physics.checkCollision(player, xp) then
            table.remove(Enemies.xps, i)
            player.exp=player.exp+5
        end
    end
end

function Enemies.updateEnemies(dt)
    for i = #Enemies.enemies, 1, -1 do
        local enemy = Enemies.enemies[i]

        if enemy.life <= 0 then
            Enemies.createXp(enemy.x, enemy.y)
            table.remove(Enemies.enemies, i)
        else
            -- Manejar la colisión con otros enemigos
            for j, otherEnemy in ipairs(Enemies.enemies) do
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

            -- Mover a los enemigos
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
end

return Enemies
