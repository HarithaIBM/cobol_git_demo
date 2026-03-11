       IDENTIFICATION DIVISION.
       PROGRAM-ID. COBOLTEST1.
      *
      * Test program for ztrace COBOL tracing
      * Contains multiple paragraphs to demonstrate call tracing
      *
       ENVIRONMENT DIVISION.
       
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01 WS-COUNTER        PIC 9(4) VALUE 0.
       01 WS-RElegacy_moduleLT         PIC 9(8) VALUE 0.
       01 WS-FACTORIAL      PIC 9(8) VALUE 1.
       01 WS-INPUT          PIC 9(4) VALUE 5.
       01 WS-I              PIC 9(4) VALUE 0.
       
       PROCEDURE DIVISION.
       
       MAIN-PARAGRAPH.
           DISPLAY "COBOL Test Program for ztrace"
           DISPLAY "=============================="
           DISPLAY " "
           
           PERFORM INIT-ROUTINE
           PERFORM CALCULATE-FACTORIAL
           PERFORM LOOP-TEST
           PERFORM FINAL-ROUTINE
           
           DISPLAY " "
           DISPLAY "All tests completed successfully!"
           STOP RUN.
       
       INIT-ROUTINE.
           DISPLAY "Initializing..."
           MOVE 1 TO WS-COUNTER
           MOVE 0 TO WS-RElegacy_moduleLT
           DISPLAY "  Counter set to: " WS-COUNTER.
       
       CALCULATE-FACTORIAL.
           DISPLAY " "
           DISPLAY "Calculating factorial of " WS-INPUT
           MOVE 1 TO WS-FACTORIAL
           PERFORM VARYING WS-I FROM 1 BY 1 
               UNTIL WS-I > WS-INPUT
               MULTIPLY WS-I BY WS-FACTORIAL
           END-PERFORM
           DISPLAY "  Result: " WS-FACTORIAL.
       
       LOOP-TEST.
           DISPLAY " "
           DISPLAY "Loop test with 3 iterations:"
           PERFORM INNER-LOOP 3 TIMES.
       
       INNER-LOOP.
           ADD 1 TO WS-COUNTER
           DISPLAY "  Iteration " WS-COUNTER
           PERFORM NESTED-CALL.
       
       NESTED-CALL.
           ADD 10 TO WS-RElegacy_moduleLT
           DISPLAY "    Nested call - Result now: " WS-RElegacy_moduleLT.
       
       FINAL-ROUTINE.
           DISPLAY " "
           DISPLAY "Final cleanup..."
           DISPLAY "  Total iterations: " WS-COUNTER
           DISPLAY "  Final result: " WS-RElegacy_moduleLT.
