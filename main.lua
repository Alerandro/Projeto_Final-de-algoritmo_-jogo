require ("inimigos")
require ("personagem")
require ("colisao")
require("vida")
require("monstro")
require("animacoracao")
require("animacao1p")
require("animabanana")
require("animaespada")
require("menu")

function love.load()
	Menuload()
	personagemload()
	inimigoload()
	vidaload()
	monstroload()
	animacaoPload()
	coracaoload()
	bananaload()
	espadaload()
	fundo = love.graphics.newImage("imagem/teste3.jpg")
	musica= love.audio.newSource("musicas/vampireKiller.mp3","static")
	fim =love.graphics.newImage("imagem/GAMEROVER1.jpg")
	musicafinal = love.audio.newSource("musicas/over.mp3", "static")

end


function love.update(dt)

	Menuupdate(dt)
	love.graphics.print("MACACO 2")
		if gamestatus==true then
			if personagem.vida > 0 then -- o jogo so vai funcionar se a vida do jgador for maior que 0
				personagemupdate(dt)
				Menuupdate(dt)
				inimigoupdate(dt)
				colisao(dt)
				vidaupdate(dt)
				monstroupdate(dt)
				animacaoPupdate(dt)
				coracaoupdate(dt)
				bananaupdate(dt)
				espadaupdate(dt)
			else -- se a vida for menor que 0 entao o jogador pode apertar espaço para reiniciar as caracteristocas do
				--persogagem e do vetor dos monstros
				if love.keyboard.isDown("space") then
					personagem.vida = 5
					personagem.ponto = 0
					inimigos = {}
					vidas ={}
					monstro ={}
					--love.audio.play(musicafinal)
				end
			end
		end
end

function love.draw()

	Menudraw()
		if gamestatus==true then
			love.graphics.draw(fundo)


			if personagem.vida > 0 then
				personagemdraw()
				inimigodraw()
				vidadraw()
				monstrodraw()
				coracaodraw()
				animacaoPdraw()
				bananadraw()
				espadadraw()
				love.audio.play(musica)


			else -- so vai aparecer para printar o texto abaixo se a vida do personagem for menor que zero
				love.audio.pause(musica)
				love.graphics.draw(fim)
				love.graphics.print("APERTE ESPAÇO PARA RECOMEÇAR")
				love.audio.play(musicafinal)
			end
		end
end
