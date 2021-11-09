0function coracaoload()
	--love.window.setMode(900,650)
    animation1 = newAnimation(love.graphics.newImage("imagem/coracao.png"), 632/7,395, 1)
end

function coracaoupdate(dt)
    animation1.currentTime = animation1.currentTime + dt
    if animation1.currentTime >= animation1.duration then
        animation1.currentTime = animation1.currentTime - animation1.duration
    end
end

function coracaodraw()
    local spriteNum1 = math.floor(animation1.currentTime / animation1.duration * #animation1.quads) + 1
    love.graphics.draw(animation1.spriteSheet, animation1.quads[spriteNum1], 0, 0, 0,60)
end

function newAnimation1(image, width, height, duration)
    local animation1 = {}
    animation1.spriteSheet = image1;
    animation1.quads = {};

    for y = 0, image1:getHeight() - height, height do
        for x = 0, image1:getWidth() - width, width do
            table.insert(animation1.quads, love.graphics.newQuad(x, y, width, height, image1:getDimensions()))
        end
    end

    animation1.duration = duration or 1
    animation1.currentTime = 0

    return animation1
end
