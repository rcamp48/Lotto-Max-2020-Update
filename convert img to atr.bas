_FULLSCREEN
OPEN "kwest54a.img" FOR INPUT AS #1
OPEN "kwest54a.atr" FOR OUTPUT AS #2

DO UNTIL EOF(1)
    INPUT #1, a$
    a1 = ASC(MID$(a$, 1, 1))
    a2 = ASC(MID$(a$, 2, 2))
    a3 = ASC(MID$(a$, 3, 3))
    a4 = ASC(MID$(a$, 4, 4))
    b1 = 255 - a1
    b2 = 255 - a2
    b3 = 255 - a3
    b4 = 255 - a4
    MID$(a$, 1, 1) = CHR$(b1)
    MID$(a$, 2, 2) = CHR$(b2)
    MID$(a$, 3, 3) = CHR$(b3)
    MID$(a$, 4, 4) = CHR$(b4)

    PRINT # 2;a$;
LOOP
PRINT #2, a$
CLOSE #1
CLOSE #2

