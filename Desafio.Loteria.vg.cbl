      $set sourceformat"free"
      *>Divisão de identificação do programa
       identification division.
       program-id. "Desafio.Loteria.vg".
       author. "Jade Rogelin".
       installation. "PC".
       date-written. 11/08/2020.
       date-compiled. 11/08/2020.



      *>Divisão para configuração do ambiente
       environment division.
       configuration section.
           special-names. decimal-point is comma.

      *>-----Declaração dos recursos externos
       input-output section.
       file-control.

       i-o-control.

      *>Declaração de variáveis
       data division.

      *>----Variaveis de arquivos
       file section.


      *>----Variaveis de trabalho
       working-storage section.

       01 ws-numeros-aposta.
          05 ws-numero1                            pic 9(02).
          05 ws-numero2                            pic 9(02).
          05 ws-numero3                            pic 9(02).
          05 ws-numero4                            pic 9(02).
          05 ws-numero5                            pic 9(02).
          05 ws-numero6                            pic 9(02).

       77 ws-contador                              pic 9(02).
       77 ws-aposta                                pic 9(02).

       01 numeros-sorteados.
          05 ws-sorteado1                          pic 9(02).
          05 ws-sorteado2                          pic 9(02).
          05 ws-sorteado3                          pic 9(02).
          05 ws-sorteado4                          pic 9(02).
          05 ws-sorteado5                          pic 9(02).
          05 ws-sorteado6                          pic 9(02).

       01  ws-sorteio.
           05  ws-semente                          pic  9(08).
           05  ws-semente1                         pic  9(08).


      *>----Variaveis para comunicação entre programas
       linkage section.

      *>----Declaração de tela
       screen section.

      *>Declaração do corpo do programa
       procedure division.


           perform 1000-inicializa.
           perform 2000-processamento.
           perform 3000-finaliza.

      *>------------------------------------------------------------------------
      *>  procedimentos de inicialização
      *>------------------------------------------------------------------------
       1000-inicializa section.

           move    zero    to  ws-contador
           move    zero    to  ws-aposta

           .
       1000-inicializa-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Processamento Principal
      *>------------------------------------------------------------------------
       2000-processamento section.

           display "   ***************************************   "
           display "   *          Faca sua Aposta            *   "
           display "   *                                     *   "
           display "   *    01 02 03 04 05 06 07 08 09 10    *   "
           display "   *    11 12 13 14 15 16 17 18 19 20    *   "
           display "   *    21 22 23 24 25 26 27 28 29 30    *   "
           display "   *    31 32 33 34 35 36 37 38 39 40    *   "
           display "   *    41 42 43 44 45 46 47 48 49 50    *   "
           display "   *    51 52 53 54 55 56 57 58 59 60    *   "
           display "   *                                     *   "
           display "   ***************************************   "

           display " "
           display "Escolha os 15 numeros de seu jogo: "
           display "numero1 : "
           accept ws-numero1
           display "numero2 : "
           accept ws-numero2
           display "numero3 : "
           accept ws-numero3
           display "numero4 : "
           accept ws-numero4
           display "numero5 : "
           accept ws-numero5
           display "numero6 : "
           accept ws-numero6

           perform 2100-geranum

           .
       2000-processamento-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Fazendo o sorteio
      *>------------------------------------------------------------------------
       2100-geranum section.

           perform until ws-aposta <> 0

               perform 2110-semente-delay
               compute  ws-sorteado1 =  function random(ws-semente) * 60

      *>    accept semente from time
               perform 2110-semente-delay
               compute  ws-sorteado2 =  function random(ws-semente + ws-sorteado1) * 60

      *>    accept semente from time
               perform 2110-semente-delay
               compute  ws-sorteado3 =  function random(ws-semente + ws-sorteado1) * 60

      *>    accept semente from time
               perform 2110-semente-delay
               compute  ws-sorteado4 =  function random(ws-semente + ws-sorteado1) * 60

      *>    accept semente from time
               perform 2110-semente-delay
               compute  ws-sorteado5 =  function random(ws-semente + ws-sorteado1) * 60

      *>    accept semente from time
               perform 2110-semente-delay
               compute  ws-sorteado6 =  function random(ws-semente + ws-sorteado1) * 60

               add 1 to ws-contador

           perform 2200-coferir-numeros


           end-perform

           .
       2100-geranum-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Conferir se não tem números repetidos
      *>------------------------------------------------------------------------
       2200-coferir-numeros section.

           perform until ws-aposta <> 0

               if (ws-sorteado1 <> ws-sorteado2) and
                  (ws-sorteado1 <> ws-sorteado3) and
                  (ws-sorteado1 <> ws-sorteado5) and
                  (ws-sorteado1 <> ws-sorteado6) and
                  (ws-sorteado1 <> 0           ) then
                   else
                       if (ws-sorteado2 <> ws-sorteado3) and
                          (ws-sorteado2 <> ws-sorteado4) and
                          (ws-sorteado2 <> ws-sorteado5) and
                          (ws-sorteado2 <> ws-sorteado6) and
                          (ws-sorteado2 <> 0) then
                           else
                               if (ws-sorteado4 <> ws-sorteado5) and
                                  (ws-sorteado4 <> ws-sorteado6) and
                                  (ws-sorteado4 <> 0           ) then
                               else
                                   display "Numero da sorte 1: " ws-sorteado1
                                           "Numero da sorte 2: " ws-sorteado2
                                           "Numero da sorte 3: " ws-sorteado3
                                           "Numero da sorte 4: " ws-sorteado4
                                           "Numero da sorte 5: " ws-sorteado5
                                           "Numero da sorte 6: " ws-sorteado6
                               end-if
                       end-if
               end-if

           display ws-sorteado1  " - "
                   ws-sorteado2  " - "
                   ws-sorteado3  " - "
                   ws-sorteado4  " - "
                   ws-sorteado5  " - "
                   ws-sorteado5  " - "
                   ws-sorteado6  " - "

           perform 2300-acertou

           end-perform

           .
       2200-coferir-numeros-exit.
           exit.
      *>------------------------------------------------------------------------
      *>  Se acerto acaba o programa
      *>------------------------------------------------------------------------
       2300-acertou section.

           perform until ws-aposta <> 0

               if (ws-numero1 = ws-numero1) or
               (ws-numero2 = ws-numero1) or
               (ws-numero3 = ws-numero1) or
               (ws-numero4 = ws-numero1) or
               (ws-numero5 = ws-numero1) or
               (ws-numero6 = ws-numero1) then
               if (ws-numero1 = ws-numero1) or
                   (ws-numero2 = ws-numero2) or
                   (ws-numero3 = ws-numero3) or
                   (ws-numero4 = ws-numero4) or
                   (ws-numero5 = ws-numero5) or
                   (ws-numero6 = ws-numero6) then
                   if (ws-numero1 = ws-numero3) or
                       (ws-numero2 = ws-numero3) or
                       (ws-numero3 = ws-numero3) or
                       (ws-numero4 = ws-numero3) or
                       (ws-numero5 = ws-numero3) or
                       (ws-numero6 = ws-numero3) then
                       if (ws-numero1 = ws-numero4) or
                           (ws-numero2 = ws-numero4) or
                           (ws-numero3 = ws-numero4) or
                           (ws-numero4 = ws-numero4) or
                           (ws-numero5 = ws-numero4) or
                           (ws-numero6 = ws-numero4) then
                           if (ws-numero1 = ws-numero5) or
                           (ws-numero2 = ws-numero5) or
                           (ws-numero3 = ws-numero5) or
                           (ws-numero4 = ws-numero5) or
                           (ws-numero5 = ws-numero5) or
                           (ws-numero6 = ws-numero5) then
                           if (ws-numero1 = ws-numero6) or
                               (ws-numero2 = ws-numero6) or
                               (ws-numero3 = ws-numero6) or
                               (ws-numero4 = ws-numero6) or
                               (ws-numero5 = ws-numero6) or
                               (ws-numero6 = ws-numero6) then
                           end-if
                           end-if
                       end-if
                   end-if
               end-if
               end-if
           end-perform

           .
       2300-acertou-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  delay
      *>------------------------------------------------------------------------
       2110-semente-delay section. *> delay de 1 centésimo de segundo

           perform 10 times
               accept ws-semente1 from time
               move ws-semente1    to ws-semente
               perform until ws-semente > ws-semente1
                   accept ws-semente from time
               end-perform
           end-perform
           .
       2110-semente-delay-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Final jogo
      *>------------------------------------------------------------------------
       2500-final section.

           if ws-contador = 1 then
               display " PARABENS!!! "
           end-if

           display "Foram" , ws-contador, "tentativas até acertat o sorteio..."

           .
       2500-final-exit.
           exit.

      *>------------------------------------------------------------------------
      *>  Finalização
      *>------------------------------------------------------------------------
       3000-finaliza section.

           Stop run
           .
       3000-finaliza-exit.
           exit.

