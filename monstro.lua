function monstroload()

	monstro_posX = 950
	monstro_posY = 500
	MovimentoMonstro = 75


	DelayMonstroTerra = 2
	TempoCriarMonstroTerra = DelayMonstroTerra
	monstros = {}

	delayMonstro = 2
end

function monstroupdate(dt)
	TempoCriarMonstroTerraTerra = TempoCriarMonstroTerra - (dt*2)
	MovimentoMonstro = MovimentoMonstro + 50*dt
	delayMonstro = delayMonstro - dt * 1
	--if TempoCriarInimigoTerra < 0 then



	if math.random(1,20) < 2 and delayMonstro < 0 then -- criando gera��o aleatoria
		delayMonstro= 2
		local monstro = {} 					-- criando um inimigo com suas caracteristicas
		monstro.x = math.random(10,850)
		monstro.y = 10
		monstro.w = 20
		monstro.h = 40
		monstro.velocidade = 160
		table.insert(monstros,monstro) 		-- inserindo no vetor inimigos
	end

	for i=#monstros,1,-1 do 				-- loop para acessar todos os inimigos individualmente
		local monstro = monstros[i] 		--passando todas as caracteriscas de um inimigo para uma variavel
		monstro.y = monstro.y + monstro.velocidade * dt -- fazendo alteraçoes nas variaveis de cada inimigo
		if monstro.x < 0 then
			table.remove( monstros, i)
		end
	end
end

function monstrodraw()
	for i=#monstros,1,-1 do
		local monstro = monstros[i]
		local spriteNumH = math.floor(animationH.currentTime / animationH.duration * #animationH.quads) + 1
		love.graphics.draw(animationH.spriteSheet, animationH.quads[spriteNumH],monstro.x - 20,monstro.y - 60)
	end

end

