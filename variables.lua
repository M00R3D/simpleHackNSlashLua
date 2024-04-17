--variables.lua
local Variables = {}

function Variables.init()
    k_w = false
    k_a = false
    k_s = false
    k_d = false
    enemies = {}
    playerSprTime = 0
    playerSprTimeMax = 300
    player = {
        x = 120,
        y = 70,
        width = 40,
        height = 40,
        speed = 3,
        imageActual = love.graphics.newImage("sprites/sprite_player00.png"),
        image0 = love.graphics.newImage("sprites/sprite_player00.png"),
        image1 = love.graphics.newImage("sprites/sprite_player01.png"),
        image2 = love.graphics.newImage("sprites/sprite_player02.png"),
        image3 = love.graphics.newImage("sprites/sprite_player03.png"),
        images = {
            love.graphics.newImage("sprites/sprite_player00.png"),
            love.graphics.newImage("sprites/sprite_player01.png"),
            love.graphics.newImage("sprites/sprite_player02.png"),
            love.graphics.newImage("sprites/sprite_player03.png")
        },
        imageGun = love.graphics.newImage("sprites/sprite_gun_left.png"),  
        gunToogleX = 0
    }
    enemyCounter = 0
    enemyTime = 240
end

function Variables.playerAnimator(dt)
    if k_a == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_right.png")
        player.gunToogleX = -30
    elseif k_d == true then
        player.imageGun = love.graphics.newImage("sprites/sprite_gun_left.png")
        player.gunToogleX = 0
    end

    playerSprTime = playerSprTime + dt
    
    if playerSprTime > 0.2 then
        playerSprTime = 0
        if player.imageActual == player.image0 then 
            player.imageActual = player.image1 
        elseif player.imageActual == player.image1 then 
            player.imageActual = player.image2 
        elseif player.imageActual == player.image2 then 
            player.imageActual = player.image3 
        else
            player.imageActual = player.image0 
        end
    end
end

return Variables
