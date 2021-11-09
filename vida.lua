function vidaload()

	vida_posX = 950
	vida_posY = 500
	MovimentoVida = 75


	DelayVidaTerra = 5
	TempoCriarVida = DelayVidaTerra
	vidas = {}

	delayVida = 5
end

function 	vidaupdate(dt)
	TempoCriarVida = TempoCriarVida - (dt*5)
	MovimentoVida = MovimentoVida + 50*dt
	delayVida = delayVida - dt * 1
	--if TempoCriarvidaTerra < 0 then



	if love.math.random(1,80) < 5 and delayVida < 0 then -- criando gera��o aleatoria
		delayVida = 5
		local vida = {}
		vida.x = love.math.random(1,850)
		vida.y = 10
		vida.w = 20
		vida.h = 40
		vida.velocidade = 150
		table.insert(vidas,vida) 		-- inserindo no vetor vidas
	end

	for i=#vidas,1,-1 do 				-- loop para acessar todos os inimigos individualmente
		local vida = vidas[i] 		--passando todas as caracteriscas de um inimigo para uma variavel
		vida.y = vida.y + vida.velocidade * dt -- fazendo alteraçoes nas variaveis de cada inimigo
		if vida.x < 0 then
			table.remove( vidas, i)
		end
	end
end

function vidadraw()
	for i=#vidas,1,-1 do
		local vida = vidas[i]
		local spriteNum1 = math.floor(animation1.currentTime / animation1.duration * #animation1.quads) + 1
		love.graphics.draw(animation1.spriteSheet, animation1.quads[spriteNum1],vida.x - 50,vida.y - 225)
	end
end

