local Input = require("input")
local Enemies = require("enemies")
local Physics = require("physics")
local Variables = require("variables")

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
    if enemyTime==0 then
        enemyTime=240
        if enemyCounter<11 then
            -- Enemies.createEnemy(200,130)
            enemyCounter=enemyCounter+1
        end
    end

    
end

function love.draw()
    love.graphics.draw(player.imageActual,player.x,player.y)
    love.graphics.draw(player.imageGun,player.x+20+player.gunToogleX,player.y+10)
    -- love.graphics.draw(player.image, love.mouse.getPosition())
    Enemies.drawEnemies()
end

   
--     function love.mousepressed(x, y, button)

--     end

--     function love.mousereleased(x, y, button)

--     end

-- function love.quit()

-- end