programa
{
     inclua biblioteca Graficos --> g
     inclua biblioteca Teclado --> t
     inclua biblioteca Mouse --> m
     inclua biblioteca Util --> u
    	inteiro final = 0
    	inteiro botao = -1 
    	inteiro empate1 = 0
     inteiro vitoria = 0
    	inteiro tela_inicio = 0
     inteiro botao_jogar = 0 
     inteiro traco_vertical = 0
     inteiro traco_horizontal = 0  
     inteiro diagonal_esquerda = 0
     inteiro diagonal_direita = 0
     inteiro receptor = 0
     inteiro bola = 0
     inteiro velha = 0
     inteiro xis = 0
    	inteiro x = 0
     inteiro y = 0
     inteiro ultima_posicao_x = 0
     inteiro ultima_posicao_y = 0
     const inteiro celulas = 9
     const inteiro jogadas = 2
     logico xis_ou_bola = falso
     logico fim = falso
     logico empate = falso
	logico em_jogo = falso
	logico final_de_jogo = falso
     logico estado_inicial_do_jogo[celulas][jogadas] = {
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso},
          {falso, falso}
     

    
     }

     inteiro posicao_final_das_jogadas[celulas][2] = {
          {60, 60},
          {240, 60},
          {420, 60},
          {60, 240},
          {240, 240},
          {420, 240},
          {60, 420},
          {240, 420},
          {420, 420}
     }
     inteiro posicao_traco_velha[8][2] = 
     {
     	{58, 117},
     	{58, 295},
     	{58, 475},
     	{115, 60},
     	{297, 60},
     	{472, 60},
     	{64, 70},
     	{39, 70}
     	
     }
     funcao inicio()
     {
     	
          carregar_imagens()
          carregar_tela()
        	executar()
    
          
     	
     }
     

     funcao carregar_imagens()
     
     {
          final = g.carregar_imagem("./final_de_jogo.png")
          empate1 = g.carregar_imagem("./empate.png")
          vitoria = g.carregar_imagem ("./vitoria.png")
          botao_jogar = g.carregar_imagem ("./JOGO _+_BOTÃO_MENOR.png")
          tela_inicio = g.carregar_imagem ("./tela_inicio.png ")
          diagonal_esquerda = g.carregar_imagem ("./diagonal_esquerda.png")
     	diagonal_direita = g.carregar_imagem ("./diagonal_direita.png")
          traco_horizontal = g.carregar_imagem ("./traço_horizontal.png")
          traco_vertical = g.carregar_imagem ("./traço_vertical.png")
          velha = g.carregar_imagem ("./lance.png")
          xis = g.carregar_imagem ("./close.png")
          bola = g.carregar_imagem ("./bola.png")
     }
     funcao carregar_tela()
	{
		se(nao em_jogo)
		{
			tela_inicial()
		}
	}

     funcao executar()
     {
     	 
          enquanto (nao Teclado.tecla_pressionada(Teclado.TECLA_ESC)) 
          {
            
             saber_se_clicou()
             atualizar_tela()
             atualizar_tela_para_tabuleiro()
             fim_de_jogo()  
             atualizar_tela_fim_de_jogo()
            
          }
     }

     funcao tratar_clique()
     {
         se(m.botao_pressionado(m.BOTAO_ESQUERDO))
         {  
			se (em_jogo) 
			{
				inteiro celula = obter_celula_clicada()
			
			
				se (celula >= 0 e jogada_valida(celula) == 1) 
				{          
			
			     gravar_jogada(celula)          
				}
			}
		}
     }

     funcao inteiro obter_celula_clicada()
     {
      	
          inteiro celula = -1
          
          se (x >= 46 e x <= 195 e y >= 58 e y <= 195) {
               celula = 0
          }
          se (x >= 207 e x <= 393 e y >= 58 e y <= 195) {
               celula = 1
          }
          se (x >= 404 e x <= 556 e y >= 58 e y <= 195) {
                celula = 2
          }
          se (x >= 46 e x <= 195 e y >= 210 e y <= 391) {
              celula = 3
          }
          se (x >= 210 e x <= 390 e y >= 210 e y <= 391) {
               celula = 4
          }     
          se (x >= 405 e x <= 555 e y >= 210 e y <= 391) {
              celula = 5
          }
          se (x >= 46 e x <= 195 e y >= 404 e y <= 543) {
               celula = 6
          }
          se (x >= 210 e x <= 390 e y >= 404 e y <= 543) {
               celula = 7
          }
          se (x >= 404 e x <= 554 e y >= 404 e y <= 543) {
               celula = 8
          }
      
          retorne celula
     }

	funcao gravar_jogada (inteiro celula)
     {
     	estado_inicial_do_jogo[celula][0] = verdadeiro
     	estado_inicial_do_jogo[celula][1] = xis_ou_bola
		xis_ou_bola = nao xis_ou_bola
     }
     
     funcao inteiro jogada_valida( inteiro celula )
	{
     	se (estado_inicial_do_jogo[celula][0] == falso)
		{
		 celula = 1
		}
		senao
		{
			celula = 0
		}
		
		retorne celula
	}
	
    	funcao desenhar_tabuleiro_na_matriz()
    
    
	{
	 	tratar_clique()
	  para (inteiro celula = 0; celula < 9; celula ++)
	  {
	 	
	 	se (estado_inicial_do_jogo[celula][0])
	 	{
	 		se (estado_inicial_do_jogo[celula][1])
		    	{
		    		g.desenhar_imagem(posicao_final_das_jogadas[celula][0], posicao_final_das_jogadas[celula][1], bola)
		    	}
			senao
			{
				g.desenhar_imagem(posicao_final_das_jogadas[celula][0], posicao_final_das_jogadas[celula][1], xis)
			}
	 	}
	  }
	}  
	       
    	funcao analisar_vitoria()    	
	{
		se (xis_ou_bola_ganhou(0, 1, 2) )
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.desenhar_imagem(posicao_traco_velha[0][0],posicao_traco_velha[0][1], traco_horizontal)
			g.desenhar_imagem(70, 230, vitoria)
			g.renderizar()
			fim = verdadeiro
		}
	  	se	(xis_ou_bola_ganhou(3, 4, 5))
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.desenhar_imagem(posicao_traco_velha[1][0],posicao_traco_velha[1][1], traco_horizontal)
			g.desenhar_imagem(115, 230, vitoria)
			g.renderizar()
			fim = verdadeiro
		}
		se	(xis_ou_bola_ganhou(6, 7, 8))
			{
				g.desenhar_imagem(0, 0, velha)
				desenhar_tabuleiro_na_matriz()
				g.desenhar_imagem(posicao_traco_velha[2][0],posicao_traco_velha[2][1], traco_horizontal)
				g.desenhar_imagem(115, 230, vitoria)
				g.renderizar()
				fim = verdadeiro
			}
		se	(xis_ou_bola_ganhou(0, 3, 6))
			{
				g.desenhar_imagem(0, 0, velha)
				desenhar_tabuleiro_na_matriz()
				g.desenhar_imagem(posicao_traco_velha[3][0],posicao_traco_velha[3][1], traco_vertical)
				g.desenhar_imagem(115, 230, vitoria)
				g.renderizar()
				fim = verdadeiro
			}
		se	(xis_ou_bola_ganhou(1, 4, 7))
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.desenhar_imagem(posicao_traco_velha[4][0],posicao_traco_velha[4][1], traco_vertical)
			g.desenhar_imagem(115, 230, vitoria)
			g.renderizar()
			fim = verdadeiro
		}
		se	(xis_ou_bola_ganhou(2, 5, 8))
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.desenhar_imagem(posicao_traco_velha[5][0],posicao_traco_velha[5][1], traco_vertical)
			g.desenhar_imagem(115, 230, vitoria)
			g.renderizar()
			fim = verdadeiro
		}
		se	(xis_ou_bola_ganhou(0, 4, 8))
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.desenhar_imagem(posicao_traco_velha[6][0],posicao_traco_velha[6][1], diagonal_esquerda)
			g.desenhar_imagem(115, 230, vitoria)
			g.renderizar()
			fim = verdadeiro
		}
		se	(xis_ou_bola_ganhou(2, 4, 6))
			{
				g.desenhar_imagem(0, 0, velha)
				g.desenhar_imagem(posicao_traco_velha[7][0],posicao_traco_velha[7][1], diagonal_direita)
				desenhar_tabuleiro_na_matriz()
				g.desenhar_imagem(115, 230, vitoria)
				g.renderizar()
				fim = verdadeiro
			}
		
	}
	
	funcao logico xis_ou_bola_ganhou(inteiro primeiro, inteiro segundo, inteiro terceiro)
	{
		se ((estado_inicial_do_jogo[primeiro][1] e
			estado_inicial_do_jogo[segundo][1] e
		  	estado_inicial_do_jogo[terceiro][1])
			      ou 
			     (estado_inicial_do_jogo[primeiro][0] e
				 estado_inicial_do_jogo[segundo][0] e
		  		 estado_inicial_do_jogo[terceiro][0] e 
		  		 nao estado_inicial_do_jogo[primeiro][1] e
			      nao estado_inicial_do_jogo[segundo][1] e
			      nao estado_inicial_do_jogo[terceiro][1]))
		   
		{
			retorne verdadeiro
		}
			
		     
		
		retorne falso
	  }
	
	funcao fim_de_jogo()
     {
     	analisar_vitoria()
     	reiniciar_tela()
     	
	}
	funcao tela_inicial()
	{
		g.iniciar_modo_grafico (verdadeiro)
          g.definir_dimensoes_janela (600, 600)
		g.desenhar_imagem (0, 0, tela_inicio)
          g.desenhar_imagem (195, 370, botao_jogar)
          g.definir_titulo_janela (" Jogo da Velha")
 		g.renderizar()
 		
	}
     funcao reiniciar_tela ()
     {
     	  
     	inteiro celula = 0
     	inteiro jogada = 0
     	se (fim == verdadeiro)
     	{
     		para(celula = 0 ; celula<9; celula++)
     		{
     			para(jogada = 0; jogada<2; jogada++)
     			{
     				estado_inicial_do_jogo[celula][jogada] = falso     	
     			}
     			u.aguarde(100)
     		}
     		
     	se( fim == verdadeiro)
     	{
     		fim = falso
     		final_de_jogo = verdadeiro 
     	}
     	}
     	empatar()
	}
	funcao empatar()
	{
		inteiro celula = 0 
		inteiro jogada = 0 
		
		se (estado_inicial_do_jogo[0][0] e
			 estado_inicial_do_jogo[1][0] e
		      estado_inicial_do_jogo[2][0] e
		  	 estado_inicial_do_jogo[3][0] e
			 estado_inicial_do_jogo[4][0] e
		  	 estado_inicial_do_jogo[5][0]e 
		  	 estado_inicial_do_jogo[6][0] e
			 estado_inicial_do_jogo[7][0] e
		  	 estado_inicial_do_jogo[8][0] e fim != verdadeiro )
		 {
		  	  empate = verdadeiro
		  	  final_de_jogo = verdadeiro
		  	  g.desenhar_imagem(0, 0, velha)
			  desenhar_tabuleiro_na_matriz()
		  	  g.desenhar_imagem(115, 230, empate1)
		  	  g.renderizar()
		  	
		 }
		  	se (empate == verdadeiro)
     		{
     			u.aguarde(1000)
	     		para(celula = 0 ; celula<9; celula++)
	     		{
	     			para(jogada = 0; jogada<2; jogada++)
	     			{
	     				estado_inicial_do_jogo[celula][jogada] = falso     	
	     			}
		 		 se( empate == verdadeiro)
	     			{
	     		empate = falso
	     			}
	 
			}
     		}
    	}
    	funcao saber_se_clicou()
    	{
    		se(m.botao_pressionado(m.BOTAO_ESQUERDO))
		{
			 	
			 	x = m.posicao_x()
                    y = m.posicao_y()
                    se (x != ultima_posicao_x ou y != ultima_posicao_y)
                    {
                         ultima_posicao_x = x
                         ultima_posicao_y = y
                         escreva("Clique esquerdo em ", x, " e ", y, "\n")
                   }
                  	 
                  
                  
		}
    	}  
	funcao botao_jogar_pressionado()
	{
		
		 se (x >= 201 e x <= 409 e y >= 374 e y <= 440) 
		 {
		    u.aguarde(100)
              em_jogo = verdadeiro
           }
		
	}
	funcao atualizar_tela_para_tabuleiro()
	{
		se(em_jogo)
		{
			g.desenhar_imagem(0, 0, velha)
			desenhar_tabuleiro_na_matriz()
			g.renderizar()
		}
	}
	funcao atualizar_tela()
	{
		se(nao em_jogo)
		{
		 botao_jogar_pressionado()	
		}
		
	}
	funcao atualizar_tela_fim_de_jogo()
	{
		se(final_de_jogo)
		{
			em_jogo = falso 
			g.desenhar_imagem(0, 0, final)
			g.renderizar()
			retomar_jogo()
		}
	}
	funcao retomar_jogo()
     {
     	se( x >= 172 e x <= 427 e y >= 357 e y <= 417)
     	{
     		u.aguarde(100)
     		em_jogo = verdadeiro
     		final_de_jogo = falso
     	}
     	se ( x>= 209 e x <= 388 e y>= 446 e y <= 506)
     	{
     		g.encerrar_modo_grafico()
     	}
     }
}




/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 11290; 
 * @DOBRAMENTO-CODIGO = [46, 57, 97, 143, 146, 149, 152, 155, 158, 161, 164, 167, 138, 217, 316, 322, 332, 356, 396, 414];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */