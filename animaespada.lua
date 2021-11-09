function espadaload()
	love.window.setMode(900,650)
    animationH = newAnimationH(love.graphics.newImage("imagem/espada.png"), 355,703/6, 1)
end

function espadaupdate(dt)
    animationH.currentTime = animationH.currentTime + dt
    if animationH.currentTime >= animationH.duration then
        animationH.currentTime = animationH.currentTime - animationH.duration
    end
end

function espadadraw()
    local spriteNumH = math.floor(animationH.currentTime / animationH.duration * #animationH.quads) + 1
    love.graphics.draw(animationH.spriteSheet, animationH.quads[spriteNumH],0, 0, 0, 0)
end

function newAnimationH(image, width, height, duration)
    local animationH = {}
    animationH.spriteSheet = image;
    animationH.quads = {};

    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animationH.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end

    animationH.duration = duration or 1
    animationH.currentTime = 0

    return animationH
end
