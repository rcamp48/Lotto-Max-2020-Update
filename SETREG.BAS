_FULLSCREEN
CLS
PRINT
PRINT "Lotto Max Package User Setup Program"
PRINT "-----------------------------------------------------------------------"
PRINT
PRINT "ShareWare : [Y] or [N] "
shareware$ = INPUT$(1)
IF shareware$ = "Y" OR shareware$ = "y" THEN
    reg$ = "ShareWare Release"
    user$ = "ShareWare Release"
    users = 0
    GOTO start
ELSE
    GOTO start1
END IF
start1:
INPUT "User Name For Program : ", reg$
start:
users = users + 1
OPEN "users.private" FOR OUTPUT AS #1
PRINT #1, users
CLOSE #1

reg3$ = "00000-00000-00000-00000-00000"
FOR i = 1 TO 29
    RANDOMIZE TIMER
    counter4 = INT(RND(1) * 10)
    MID$(reg3$, i, i) = CHR$(counter4 + 48)
NEXT i
MID$(reg3$, 6, 6) = CHR$(45)
MID$(reg3$, 12, 12) = CHR$(45)
MID$(reg3$, 18, 18) = CHR$(45)
MID$(reg3$, 24, 24) = CHR$(45)
username$ = reg$
userserial$ = reg3$
CLS
PRINT
OPEN "register.private" FOR APPEND AS #2
IF users$ <> "ShareWare Release" THEN
    PRINT #2, reg$
    PRINT #2, reg3$
END IF
CLOSE #2
displayit:
OPEN "register.private" FOR INPUT AS #2
_FULLSCREEN
CLS
PRINT
PRINT "List of User Names and Serial Numbers Issued"
PRINT "--------------------------------------------"
DO UNTIL EOF(2)
    INPUT #2, reg$
    INPUT #2, reg3$
    PRINT USING "User Name     :  \                                              \"; reg$
    PRINT USING "Serial Number :  \                           \"; reg3$
LOOP
OPEN "users.private" FOR INPUT AS #1
INPUT #1, users
CLOSE #1
PRINT "Users Total = "; users
CLOSE #2
counter4 = 0
FOR i = 1 TO LEN(reg$)
    counter4 = counter4 + 5.4851276
    z2 = ASC(MID$(reg$, i, i))
    MID$(reg$, i, i) = CHR$(z2 + counter4)
NEXT i
OPEN "dname.dat" FOR OUTPUT AS #1
PRINT #1, reg$
CLOSE #1
counter4 = 0
FOR i = 1 TO LEN(reg3$)
    counter4 = counter4 + 5.4269537
    z2 = ASC(MID$(reg3$, i, i))
    MID$(reg3$, i, i) = CHR$(z2 + counter4)
NEXT i
OPEN "reg.dat" FOR OUTPUT AS #1
PRINT #1, reg3$
CLOSE #1
IF users$ <> "ShareWare Release" THEN
    SHELL "xcopy lotto.exe e:\ /Y"
    SHELL "xcopy grmode.exe e:\ /Y"
    SHELL "xcopy lotto2020.exe e:\ /Y"
    SHELL "xcopy *.dat e:\ /Y"
    SHELL "xcopy *.doc e:\ /Y"
END IF
finish:

END

