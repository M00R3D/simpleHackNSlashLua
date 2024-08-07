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
        imageActual = love.graphics.newImage("sprites/monje.png"),
        image0 = love.graphics.newImage("sprites/monje.png"),
        image1 = love.graphics.newImage("sprites/monje.png"),
        image2 = love.graphics.newImage("sprites/monje.png"),
        image3 = love.graphics.newImage("sprites/monje.png"),
        images = {
            love.graphics.newImage("sprites/monje.png"),
            love.graphics.newImage("sprites/monje.png"),
            love.graphics.newImage("sprites/monje.png"),
            love.graphics.newImage("sprites/monje.png")
        },
        imageGun = love.graphics.newImage("sprites/sprite_gun_left.png"),  
        gunToogleX = 0,
        isDead = false
    }
end
return PlayerStart
