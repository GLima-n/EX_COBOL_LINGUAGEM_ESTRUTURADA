      *================================================================*
      * Author: GABRIEL NASCIMENTO                                     *
      * Date: 22/08/2021                                    ==>COBOL   *
      *                                                                *
      *                                                                *
      * -PROGRAMA DE INSERÇÃO DE BLOCOS DE PROCEDIMENTOS DENTRO        *
      * DOS BLOCOS DE SESSÃO, DEMONSTRAÇÃO DA LINGUAGEM ESTRUTURADA.   *
      *================================================================*
       IDENTIFICATION                                        DIVISION.
       PROGRAM-ID. PROG00001.
       ENVIRONMENT                                           DIVISION.
       INPUT-OUTPUT                                 SECTION.
       DATA                                                  DIVISION.
       FILE                                         SECTION.
       WORKING-STORAGE                              SECTION.
       77 WS-PRINT        PIC X(20) VALUE SPACES.
       LINKAGE                                      SECTION.
       SCREEN                                       SECTION.
       PROCEDURE                                             DIVISION.

      *>-----------------------PRIMEIRA SESSAO--------------------------
            MAIN-PROG                               SECTION.
      *>----------------PARAGRAFOS DA PRIMEIRA SESSAO-------------------
            S001-PROG1.
                MOVE'S001-PROG1'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM SEC-PROG.
            S001-PROG2.
                MOVE'S001-PROG2'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM SEC-PROG.
            S001-PROG3.
              IF WS-PRINT NOT EQUAL 'S002-PROG3' THEN
                MOVE'S001-PROG3'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM S002-PROG3
              ELSE
                PERFORM FIM-PROC
                END-IF.
      *>------------------------SEGUNDA SESSAO--------------------------
            SEC-PROG                                SECTION.
      *>-----------------PARAGRAFOS DA SEGUNDA SESSAO-------------------
            S002-PROG1.
              IF WS-PRINT NOT EQUAL 'S001-PROG2' THEN
                MOVE'S002-PROG1'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM S001-PROG2
              END-IF.
            S002-PROG2.
                MOVE'S002-PROG2'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM S001-PROG3.

            S002-PROG3.
                MOVE'S002-PROG3'       TO WS-PRINT
                DISPLAY WS-PRINT
                PERFORM S001-PROG3.
      *>-------------------SESSAO DE FINALIZACAO------------------------
           FIM-PROC                                  SECTION.
                MOVE'FIM-PROC'         TO WS-PRINT
                DISPLAY WS-PRINT
            STOP RUN.
       END PROGRAM PROG00001.
