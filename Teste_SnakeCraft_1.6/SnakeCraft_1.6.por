programa
{
	inclua biblioteca Objetos -->o
	inclua biblioteca Sons --> s
	inclua biblioteca Teclado --> t
	inclua biblioteca Util --> u
	inclua biblioteca Graficos --> g

	
	inteiro cob_b = g.carregar_imagem("Cobra_baixo.png")
   	inteiro cob_c = g.carregar_imagem("Cobra_cima.png")
   	inteiro cob_e = g.carregar_imagem("Cobra_esquerda.png")
   	inteiro cob_d = g.carregar_imagem("Cobra_direita.png")
   	inteiro comida = g.carregar_imagem("comida.png")

   	
	inteiro fundo_menu = g.carregar_imagem("tela_menu_700.png")
	inteiro img_2 = g.carregar_imagem("SnakeCraft_logo3.png")
	inteiro img_1 = g.carregar_imagem("Fundo_01.png")
	inteiro opcao_selecionada = 1

	logico direita = falso, esquerda = falso, cima = falso, baixo = falso

	const inteiro 	L_JANELA = 700
	const inteiro 	A_JANELA = 700

	inteiro xcabeca_cobra = 300
	inteiro ycabeca_cobra = 300

	inteiro direcao_cobra = 1
	inteiro direcao_cauda = 0
	inteiro delay = 63
	
	inteiro tempo = u.tempo_decorrido()
	
	inteiro pontuacao = 0

	inteiro xposicoes_comida[27] =
	{60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400,420,440,460,480,500,520,540,560,580}
	inteiro yposicoes_comida[27] =
	{60,80,100,120,140,160,180,200,220,240,260,280,300,320,340,360,380,400,420,440,460,480,500,520,540,560,580}

	inteiro xcomida = 300
	inteiro ycomida = 300

	inteiro xcauda_cobra [600]
	inteiro ycauda_cobra [600]


	inteiro tamanho_cobra = 2

	//Criar Abertura
	funcao Abertura(){
		
		//fontes	
		g.carregar_fonte("Minecrafter.ALT.ttf")
		g.carregar_fonte("Minecrafter.Reg.ttf")
		inteiro gifmenu = g.carregar_imagem("A_&_ALogotipo.gif")
		inteiro controleGif = 0
		inteiro contador = 0		
		g.iniciar_modo_grafico(verdadeiro)		
		g.definir_dimensoes_janela(L_JANELA, A_JANELA)
		g.definir_titulo_janela("SnakeCraft 1.0")
		g.definir_icone_janela(img_2)
		
		//g.redimensionar_imagem(gifmenu, L_JANELA, A_JANELA, verdadeiro)

		//enquanto(verdadeiro){
		enquanto(contador <= g.obter_numero_quadros_gif(gifmenu)){
			
			g.desenhar_quadro_atual_gif( 0, 0, gifmenu)
			g.proximo_frame_gif(gifmenu)	
			
			//u.aguarde(1)			
				se (controleGif <= 5){
					g.proximo_frame_gif(gifmenu)
					contador++
					controleGif = 0
				}senao{
					controleGif++
				}
				
				
				g.definir_cor(g.COR_VERMELHO)
				g.definir_tamanho_texto(74.0)
				g.definir_fonte_texto("Minecrafter")
				g.desenhar_texto(242, 304, "Game")
				
				g.definir_cor(g.COR_PRETO)
				g.definir_tamanho_texto(70.0)
				g.definir_fonte_texto("Minecrafter")
				g.desenhar_texto(250, 300, "Game")
				g.renderizar()	
				//Tecla pra nao espera abertura 
				se (t.alguma_tecla_pressionada()){	
					menu()
			}
								
		}
					menu()					
	}
	
	funcao menu(){
		
		//g.redimensionar_imagem("tela_menu.png, 700, 700, verdadeiro)
		g.definir_dimensoes_janela(L_JANELA, A_JANELA)
		g.definir_titulo_janela("SnakeCraft 1.0")
		g.definir_icone_janela(img_2)
		
			
				
		enquanto(verdadeiro){
			inteiro agora = u.tempo_decorrido()
			g.desenhar_imagem(0, 0, fundo_menu)
			
		escolha (opcao_selecionada)
		{
			caso 1:
				
				g.definir_tamanho_texto(104.)
				g.definir_fonte_texto("Minecrafter")
				g.desenhar_texto(193, 398, "Start")
				g.definir_fonte_texto("Minecrafter Alt")
				g.desenhar_texto(228, 581, "Sair") 
				g.definir_tamanho_texto(100.)
				g.definir_cor(g.COR_VERMELHO)
				g.definir_fonte_texto("Minecrafter")			
				g.desenhar_texto(200, 388, "Start")
				g.definir_cor(g.criar_cor(207, 207, 207))
				g.definir_fonte_texto("Minecrafter Alt")
				g.desenhar_texto(235, 571, "Sair")
			pare
			
			caso 2:
				
				g.definir_tamanho_texto(104.)
				g.definir_fonte_texto("Minecrafter Alt")
				g.desenhar_texto(193, 398, "Start")
				g.definir_fonte_texto("Minecrafter")
				g.desenhar_texto(228, 581, "Sair")  				
				g.definir_tamanho_texto(100.)
				g.definir_cor(g.criar_cor(207, 207, 207))
				g.definir_fonte_texto("Minecrafter Alt")			
				g.desenhar_texto(200, 388, "Start")
				g.definir_cor(g.COR_VERMELHO)
				g.definir_fonte_texto("Minecrafter")
				g.desenhar_texto(235, 571, "Sair")
			pare
		}		
	
				se (t.tecla_pressionada(t.TECLA_SETA_ACIMA) e agora-tempo > 100){
					opcao_selecionada--
					se(opcao_selecionada<1){
						opcao_selecionada=1
					}
					tempo = u.tempo_decorrido()
				}
				
				se (t.tecla_pressionada(t.TECLA_SETA_ABAIXO) e agora-tempo > 100){
					opcao_selecionada++
					se(opcao_selecionada>2){
						opcao_selecionada=2
					}
					tempo = u.tempo_decorrido()
				}
				se (opcao_selecionada == 1 e agora-tempo > 100) 
					se (t.tecla_pressionada(t.TECLA_ENTER)){
						//tela de Loand
						//inicia jogo
						jogo()
				}
					se (opcao_selecionada ==2 e agora-tempo > 100) 
						se (t.tecla_pressionada(t.TECLA_ENTER)){
							g.fechar_janela()
					}
		
	           //ADD MOUSE ou não
	           g.renderizar()					
			}
		}
		
	
	funcao jogo(){
   
	   	enquanto(verdadeiro){
	   	se(t.tecla_pressionada(t.TECLA_ESC)){
			menu()
	   	}
	   	g.limpar()
	   	g.desenhar_imagem(0, 0, img_1)
	   	desenhar_painel()
	   	atualizar_cobra()	
	   	movimento()
	   	Pontuacao()
	   	cobra_bateu_parede()				
		desenhar_comida()	
		desenhar_cobra()
		desenha_cauda()		
		sortear_comida()					
		g.renderizar()
		u.aguarde(delay)
	    	
	   	}
	}
		   	
  	funcao desenhar_painel(){
	   	g.definir_cor(g.COR_AZUL)
	   	g.desenhar_retangulo(0, 0, 300,30, falso, verdadeiro)
	   	g.definir_cor(g.COR_AMARELO)
	   	g.definir_tamanho_texto(30.0)
	   	g.definir_estilo_texto(falso, verdadeiro, falso)
	   	g.definir_fonte_texto("Minecrafter Alt")
	   	
	   	g.desenhar_texto(5, 10, "Score:" + pontuacao)
	   	g.definir_fonte_texto("Arial Black")
	   	//A font "Minecrafter" não tem acentos!
	   	g.desenhar_texto(121, 0, ":" )

	  	 }
		  	 
	funcao desenhar_cobra(){
			
			g.definir_cor(g.COR_VERMELHO)
			g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 20, 20, verdadeiro, verdadeiro)
		escolha(direcao_cobra)
		{
			caso 1:
			//g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 40, 50, falso, verdadeiro)
			g.desenhar_imagem(xcabeca_cobra-5, ycabeca_cobra-5, cob_d)
			
			pare

			caso 2:
			//g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 40, 50, falso, verdadeiro)
			g.desenhar_imagem(xcabeca_cobra-7, ycabeca_cobra-5, cob_e)
			
			pare

			caso 3:
			//g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 40, 50, falso, verdadeiro)
			g.desenhar_imagem(xcabeca_cobra-10, ycabeca_cobra-7, cob_c)

			pare

			caso 4:
			//g.desenhar_retangulo(xcabeca_cobra, ycabeca_cobra, 40, 50, falso, verdadeiro)
			g.desenhar_imagem(xcabeca_cobra-5, ycabeca_cobra-2, cob_b)

			pare

			}
 
	 	se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)){
			direita = verdadeiro
			esquerda = falso
				cima = falso
				baixo = falso
							
	
		}senao se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)){
			direita = falso
			esquerda = verdadeiro
				cima = falso
				baixo = falso
			
						
		}senao se(t.tecla_pressionada(t.TECLA_SETA_ACIMA)){
			direita = falso
			esquerda = falso
				cima = verdadeiro
				baixo = falso
			
				
		}senao se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO)){
			direita = falso
			esquerda = falso
				cima = falso
				baixo = verdadeiro
			}								
		}		
 
	funcao movimento(){
		se(direita == verdadeiro){
			direcao_cobra = 1
			xcabeca_cobra += 20

		}senao se(esquerda == verdadeiro){
			direcao_cobra = 2
			xcabeca_cobra -= 20
			
		}senao se(cima == verdadeiro){
			direcao_cobra = 3
			ycabeca_cobra -= 20
			
		}senao se(baixo == verdadeiro){
			direcao_cobra = 4
			ycabeca_cobra += 20
			
		}	
		
	}

	funcao cobra_bateu_parede()  {
			
			//(xcabeca_cobra >) = parede esquerda
			//(xcabeca_cobra <) = parede direita
			se(xcabeca_cobra > 600 ou xcabeca_cobra < 50 ou cobra_se_mordeu()){
				xcabeca_cobra = 300
				ycabeca_cobra = 300
				//cobra perde o comprimento
				tamanho_cobra = 2
				//cobra volta parada
				direita = falso
			esquerda = falso
				cima = falso
				baixo = falso
			}
			//(ycabeca_cobra >) = parede inferior
			//(ycabeca_cobra <) = parede superior
			senao se(ycabeca_cobra > 600 ou ycabeca_cobra < 50 ou cobra_se_mordeu()){
				xcabeca_cobra = 300
				ycabeca_cobra = 300
				//cobra perde o comprimento 
				tamanho_cobra = 2				
				//cobra volta parada 			
				direita = falso
			esquerda = falso
				cima = falso
				baixo = falso
				
			
			} 		
		}
   		
					
	funcao logico cobra_comeu_comida(){
		se(xcabeca_cobra == xcomida e ycabeca_cobra == ycomida){
			retorne (verdadeiro)
												
		}senao{
			retorne (falso)

			}
		}

	funcao sortear_comida(){
		inteiro xindice = u.sorteia(0, 21)
		inteiro yindice = u.sorteia(0, 21)
		se(cobra_comeu_comida()){
			xcomida = xposicoes_comida[xindice]
			ycomida = yposicoes_comida[yindice]
		}
	}

		
	funcao desenhar_comida(){
		g.definir_cor(g.criar_cor(0, 255, 255))
		g.desenhar_retangulo(xcomida, ycomida, 20, 20, verdadeiro, verdadeiro)
		g.desenhar_imagem(xcomida-8, ycomida-15, comida)
			
			
		}

	funcao atualizar_cobra(){
		xcauda_cobra [0] = xcabeca_cobra
		ycauda_cobra [0] = ycabeca_cobra
		para(inteiro i = 599; i > 0; i--){
			xcauda_cobra [i] = xcauda_cobra [i-1]
			ycauda_cobra [i] = ycauda_cobra [i-1]
		}
	}
	
	funcao desenha_cauda(){
		se(cobra_comeu_comida()){
			tamanho_cobra++
		}
		para(inteiro i = 0; i < tamanho_cobra; i++){
		g.definir_cor(g.criar_cor(14, 209, 68))
		//g.desenhar_retangulo(xcauda_cobra[i]-10, ycauda_cobra[i]+10, 20, 20, falso, verdadeiro)
		
		escolha(direcao_cauda)
		{
			caso 1:
			//g.desenhar_imagem(xcauda_cobra[i], ycauda_cobra[i], cau_d)
			g.desenhar_retangulo(xcauda_cobra[i], ycauda_cobra[i]+5, 20, 20, verdadeiro, verdadeiro)
			
			pare

			caso 2:
			g.desenhar_retangulo(xcauda_cobra[i]+8, ycauda_cobra[i]+5, 20, 20, verdadeiro, verdadeiro)
			//g.desenhar_imagem(xcauda_cobra[i], ycauda_cobra[i], cau_e)
			
			pare

			caso 3:
			g.desenhar_retangulo(xcauda_cobra[i], ycauda_cobra[i]+8, 20, 20, verdadeiro, verdadeiro)
			//g.desenhar_imagem(xcauda_cobra[i], ycauda_cobra[i], cau_c)
			
			pare

			caso 4:
			g.desenhar_retangulo(xcauda_cobra[i]+5, ycauda_cobra[i]+3, 20, 20, verdadeiro, verdadeiro)
			//g.desenhar_imagem(xcauda_cobra[i], ycauda_cobra[i], cau_b)
			
			pare
		}
		
			se (t.tecla_pressionada(t.TECLA_SETA_DIREITA)){
				//g.desenhar_imagem(xcauda_cobra[i]-5, ycauda_cobra[i]-5, cau_d)
				direcao_cauda = 1
				
			}senao se(t.tecla_pressionada(t.TECLA_SETA_ESQUERDA)){
				//g.desenhar_imagem(xcauda_cobra[i]-5, ycauda_cobra[i]-5, cau_e)
				direcao_cauda = 2
						
			}senao se(t.tecla_pressionada(t.TECLA_SETA_ACIMA)){
				//g.desenhar_imagem(xcauda_cobra[i]-5, ycauda_cobra[i]-5, cau_c)
				direcao_cauda = 3
	
			}senao se(t.tecla_pressionada(t.TECLA_SETA_ABAIXO)){
				//g.desenhar_imagem(xcauda_cobra[i]-5, ycauda_cobra[i]-5, cau_b)
				direcao_cauda = 4
				
			}
		}			
	}

	funcao Pontuacao(){
		pontuacao = tamanho_cobra - 2
		
	}

	funcao logico cobra_se_mordeu(){
		logico mordeu = falso
		para(inteiro i = 0; i < tamanho_cobra; i++){
			se(xcabeca_cobra == xcauda_cobra[i] e ycabeca_cobra == ycauda_cobra[i]){
				mordeu = verdadeiro
			}
		}
		retorne mordeu
	}
	
	funcao inicio()
	{
		Abertura()

		
		
			
	}
	
} 
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 931; 
 * @DOBRAMENTO-CODIGO = [102, 335, 345, 355, 363, 372, 434, 432];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */