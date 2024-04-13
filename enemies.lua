--enemies.lua
local Enemies={}


    function Enemies.createEnemy(x, y)
        enemy = 
        {
            image = love.graphics.newImage("sprites/sprite_enemy_a/sprite_enemy_a0.png"),
            x=x,
            y=y,
            width=30,
            height=30,
            speed=2
        }    
        table.insert( enemies, enemy )
    end

    function Enemies.drawEnemies()
        for i, enemy in ipairs(enemies) do
            love.graphics.draw(enemy.image, enemy.x, enemy.y)
        end
    end

    function Enemies.updateEnemies(dt)
        for i, enemy in ipairs(enemies) do

            if enemy.x<player.x then
                enemy.x=enemy.x+enemy.speed
            end
            if enemy.x>player.x then
                enemy.x=enemy.x-enemy.speed
            end
            if enemy.y<player.y then
                enemy.y=enemy.y+enemy.speed
            end
            if enemy.y>player.y then
                enemy.y=enemy.y-enemy.speed
            end
        end
    end

    
return Enemies