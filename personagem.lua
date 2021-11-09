function personagemload()
	personagem = {} -- organizar todas as caracteristicas do personagem em um vetor
	personagem.x = 50
	personagem.y = 535
	personagem.h = 30
	personagem.e = 30
	personagem.velocidade = 400
 -- vida e pontuaï¿½ï¿½o
	personagem.estaVivo = true
	personagem.vida = 5
 	personagem.ponto = 0
	love.window.setMode(700,850)

end

function personagemupdate(dt)  -- movimentação

	if love.keyboard.isDown('d') then -- se pressionar d , para direita
        personagem.x = personagem.x + dt*personagem.velocidade
    end
	if love.keyboard.isDown('a') then
		personagem.x = personagem.x - dt*personagem.velocidade
	end
	if love.keyboard.isDown('w') then
		personagem.y = personagem.y - dt*personagem.velocidade
	end

	if love.keyboard.isDown('s') then
		personagem.y = personagem.y + dt*personagem.velocidade
	end

	if personagem.y > 540 then		--impondo limites ao cenario.
		personagem.y = 540
	end

	if personagem.y < 0 then
		personagem.y = 0
	end

	if personagem.x < 0 then
		personagem.x = 0
	end

	if personagem.x > 850 then
		personagem.x = 850
	end
end

function personagemdraw()
	local spriteNumP= math.floor(animationP.currentTime / animationP.duration * #animationP.quads) + 1
	love.graphics.draw(animationP.spriteSheet, animationP.quads[spriteNumP], personagem.x - 16	,personagem.y - 245, 0, 1.9)

	love.graphics.print("PONTOS:".. personagem.ponto,0,0,0, 1.5)
	love.graphics.print("VIDA:".. personagem.vida,0,100,0, 1.5)
end
