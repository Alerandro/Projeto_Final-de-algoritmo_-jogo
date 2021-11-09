function Menuload()

    namex = 400
    namey = 205
    nameX  = 400
    nameY = 305

    posxbutton = 300
    posybutton = 200


    alturaButton = 60
    larguraButton = 250

    FotoDoMenu = love.graphics.newImage( "imagem/menu2.png" )

    gamestatus=false

end

function Menuupdate(dt)

    if love.mouse.isDown(1) and buttonStart  then
        gamestatus=true
    end

    if love.mouse.isDown(1) and buttonExit  then
        love.event.quit(0)
    end

end


function Menudraw()

    buttonStart= love.mouse.getX() > 300 and love.mouse.getY() > 200 and love.mouse.getX() < 700 and love.mouse.getY() < 460
    buttonExit=  love.mouse.getX() > 300 and love.mouse.getY() > 270 and love.mouse.getX() < 700 and love.mouse.getY() < 470

    if  gamestatus==false then
    
        love.graphics.draw(FotoDoMenu, 0, 0, 0)
        love.graphics.print("Start",namex,namey,0, 2)
        love.graphics.print("Start",namex,namey,0, 2)
        love.graphics.print("Exit",nameX,nameY, 0, 2)
        
    end

end
