--playerStart.lua

local PlayerStart = {}

function PlayerStart.createPlayer()
    playerSprTime = 0
    playerSprTimeMax = 300
    player = {
        x = 120,
        y = 70,
        width = 40,
        height = 40,
        speed = 3,
        life = 1000,
        maxLife = 1000,
        mana = 30,
        maxMana = 30,
        exp = 0,
        maxExp = 30,
        lvl = 1,
        maxLvl = 99,
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
        gunToogleX = 0,
        isDead = false
    }
end
return PlayerStart
