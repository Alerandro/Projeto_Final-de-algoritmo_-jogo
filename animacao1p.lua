function newAnimationP(image, width, height, duration)   -- paramentros da animação
    local animationP = {}
    animationP.spriteSheet = imageP;
    animationP.quads = {};

    for y = 0, imageP:getHeight() - height, height do		--posições das imagens
        for x = 0, imageP:getWidth() - width, width do
            table.insert(animationP.quads, love.graphics.newQuad(x, y, width, height, imageP:getDimensions()))
        end
    end

    animationP.duration = duration or 1   -- alterando valores
    animationP.currentTime = 0

    return animationP
end



function animacaoPload()
	--love.window.setMode(900,650)
    animationP= newAnimation(love.graphics.newImage("imagem/macaco.png"), 212/5, 214, 1)
end

function animacaoPupdate(dt)
    animationP.currentTime = animationP.currentTime + dt
    if animationP.currentTime >= animationP.duration then
        animationP.currentTime = animationP.currentTime - animationP.duration
    end
end

function animacaoPdraw()
    local spriteNumP = math.floor(animationP.currentTime / animationP.duration * #animationP.quads) + 1
    love.graphics.draw(animationP.spriteSheet, animationP.quads[spriteNumP], 0, 0, 1, 0 , 1.7)
end
