       IDENTIFICATION DIVISION.
       PROGRAM-ID. HELLOTest.

       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SOURCE-COMPUTER. IBM-370.
       OBJECT-COMPUTER. IBM-370.

       DATA DIVISION.
       WORKING-STORAGE SECTION.
       01  TEST-RESULT  PIC X(10).

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           CALL 'CobolUnit' USING TEST-RESULT.
           DISPLAY 'Running HELLOTest...'.
           PERFORM TEST-CASE-1.
           PERFORM TEST-CASE-2.
           STOP RUN.

       TEST-CASE-1.
           DISPLAY 'Test Case 1: Checking Hello World'.
           IF FUNCTION-HELLO() = 'Hello, World!'
               MOVE 'PASS' TO TEST-RESULT
           ELSE
               MOVE 'FAIL' TO TEST-RESULT
           END-IF.
           DISPLAY 'Test Case 1 Result: ' TEST-RESULT.

       TEST-CASE-2.
           DISPLAY 'Test Case 2: Checking Greeting'.
           IF FUNCTION-GREET('Alice') = 'Hello, Alice!'
               MOVE 'PASS' TO TEST-RESULT
           ELSE
               MOVE 'FAIL' TO TEST-RESULT
           END-IF.
           DISPLAY 'Test Case 2 Result: ' TEST-RESULT.

       FUNCTION-HELLO.
           RETURN 'Hello, World!'.

       FUNCTION-GREET.
           LINKAGE SECTION.
           01  NAME  PIC X(20).
           PROCEDURE DIVISION USING NAME.
           RETURN 'Hello, ' NAME '!'.