local Variables={}
function Variables.init( )
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
    enemyCounter=0
    enemyTime=240
end
    
return Variables