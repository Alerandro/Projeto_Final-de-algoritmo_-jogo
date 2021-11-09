
function checarColisao( x1, y1, w1, h1, x2, y2, w2, h2 )
	return x1 < x2 + w2 and x2 < x1 + w1 and y1 < y2 + h2 and y2 < y1 + h1
end

function colisao()
	for i = #inimigos,1,-1  do  -- verificar o contato dos inimigos
		local inimigo = inimigos[i]
		if checarColisao (inimigo.x,inimigo.y, inimigo.w, inimigo.h, personagem.x,personagem.y,personagem.e,personagem.h )  then
			table.remove (inimigos,i)
			personagem.ponto = personagem.ponto + 1 -- pontuaçao
			estavivo = false
		end
		if inimigo.y > 600 then
			personagem.vida = personagem.vida - 5 -- se o personagem passar do limite a vida e decrementada
			-- e o inimigo e retirado do vetor
			table.remove(inimigos, i)
		end
	end

	for i = #vidas, 1 , -1 do
		local vida=vidas [i]
		if checarColisao(vida.x , vida.y , vida.w, vida.h , personagem.x, personagem.y,personagem.e,personagem.h) then
			table.remove ( vidas, i )
			personagem.vida = personagem.vida + 2
		end
	end

	for i= #monstros , 1 , -1 do
		local monstro = monstros[i]
		if checarColisao( monstro.x, monstro.y, monstro.w, monstro.h, personagem.x , personagem.y, personagem.e, personagem.h) then
			table.remove( monstros,i)
			personagem.vida = personagem.vida - 30
			if monstro.y > 600 then
			table.remove( monstros,i)
			end
		end
	end
end

