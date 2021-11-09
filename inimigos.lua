function	inimigoload()

	Inimigo_posX = 950
	Inimigo_posY = 500
	MovimentoInimigo = 75


	DelayInimigoTerra =2
	TempoCriarInimigoTerra = DelayInimigoTerra
	inimigos = {}

	delayInimigo = 2
end

function 	inimigoupdate(dt)
	TempoCriarInimigoTerra = TempoCriarInimigoTerra - (dt*2)
	MovimentoInimigo = MovimentoInimigo + 50*dt
	delayInimigo = delayInimigo - dt * 1
	--if TempoCriarInimigoTerra < 0 then


	--TempoCriarInimigoTerra = DelayInimigoTerra
	if love.math.random(1,50) < 2 and delayInimigo < 0 then -- criando gera��o aleatoria
		delayInimigo = 2
		local inimigo = {} 					-- criando um inimigo com suas caracteristicas
		inimigo.x = love.math.random(2,85)
		inimigo.y = 10
		inimigo.w = 20
		inimigo.h = 40
		inimigo.velocidade = 200
		table.insert(inimigos,inimigo) 		-- inserindo no vetor inimigos
	end

	for i=#inimigos,1,-1 do 				-- loop para acessar todos os inimigos individualmente
		local inimigo = inimigos[i] 		--passando todas as caracteriscas de um inimigo para uma variavel
		inimigo.y = inimigo.y + inimigo.velocidade * dt -- fazendo alteraçoes nas variaveis de cada inimigo
		if inimigo.y < 0 then
			table.remove( inimigos, i)
		end
	end
end

function inimigodraw()
	for i=#inimigos,1,-1 do
		local inimigo = inimigos[i]
		local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
		love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum], inimigo.x - 50 ,inimigo.y - 100)
		end
end

