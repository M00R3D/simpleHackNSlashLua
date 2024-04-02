function createEnemy(x, y)
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

function drawEnemies()
    for i, enemy in ipairs(enemies) do
        love.graphics.draw(enemy.image, enemy.x, enemy.y)
     end
end

function updateEnemies(dt)
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
function love.load()
    
    k_w= false;k_a= false;k_s= false;k_d= false
    enemies={}
    player = 
    {
        x=120,
        y=70,
        width=40,
        height=40,
        speed=3
    }
    createEnemy(100,100)
    createEnemy(60,120)
    createEnemy(200,130)
end



function love.update(dt)
    if k_w==true then    player.y=player.y-(1*player.speed)
    end
    if k_a==true then     player.x=player.x-(1*player.speed)
    end
    if k_d==true then    player.x=player.x+(1*player.speed)
    end
    if k_s==true then    player.y=player.y+(1*player.speed)
    end
    if player.x<0 then    player.x=0 end
    if player.y<0 then    player.y=0 end
    if player.x>(love.graphics.getWidth() - player.width) then    player.x=love.graphics.getWidth() - player.width
    end
    if player.y>(love.graphics.getHeight() - player.height) then    player.y=love.graphics.getHeight()- player.height
    end

    updateEnemies(dt)
    
end

function love.draw()
    love.graphics.setColor(250, 0, 0, 255)
    love.graphics.rectangle("fill", player.x, player.y, player.width, player.height)
    love.graphics.setColor(250, 100, 0, 255)
    drawEnemies()
end

    function love.keypressed(key)
        if key == "w" then
            k_w = true
        elseif key == "a" then
            k_a = true
        elseif key == "s" then
            k_s = true
        elseif key == "d" then
            k_d = true
        end
    end

    function love.keyreleased(key)
        if key == "w" then
            k_w = false
        elseif key == "a" then
            k_a = false
        elseif key == "s" then
            k_s = false
        elseif key == "d" then
            k_d = false
        end
    end

    function love.mousepressed(x, y, button)

    end

    function love.mousereleased(x, y, button)

    end

function love.quit()

end