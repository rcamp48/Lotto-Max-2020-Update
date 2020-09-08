OPEN "grmode.dat" FOR OUTPUT AS #1
_FULLSCREEN
start:
CLS
PRINT
PRINT "Graphics Mode Setup for Lotto Max Package Version 2020 "
PRINT "-------------------------------------------------------"
PRINT
INPUT "Do want colour screens [default Yes]       : ", cs$
IF cs$ = "y" THEN
    cs$ = "Y"
ELSEIF cs$ = "n" THEN
    cs$ = "N"
END IF
IF cs$ = "" THEN
    cs$ = "Y"
END IF
INPUT "Do you have a printer online [default NO] : ", printer$
IF printer$ = "y" THEN
    printer$ = "Y"
ELSEIF printer$ = "n" THEN
    printer$ = "N"
END IF
IF printer$ = "" THEN
    printer$ = "N"
END IF
PRINT
PRINT "[A]  -  No Graphics Card"
PRINT "[B]  -  VGA Mode"
PRINT "[C]  -  HDMI Mode"
PRINT
PRINT "[Return] defaults to HDMI Mode ..."
PRINT
INPUT "Enter [A B C] : ", answer$
IF answer$ = "a" OR answer$ = "A" THEN
    stype = 0
    stype$ = "None"
ELSEIF answer$ = "b" OR answer$ = "B" THEN
    stype = 1
    stype$ = "VGA"
ELSEIF answer$ = "c" OR answer$ = "C" THEN
    stype = 2
    stype$ = "HDMI"
ELSEIF answer$ = "" THEN
    stype = 2
    stype$ = "HDMI"
END IF
qqqq:
PRINT
INPUT "How many Numbers in the Wheeling System [14 to 42] [defaults to 14] : ", qqq
IF qqq < 14 OR qqq > 42 THEN
    qqq = 14
END IF
CLS
PRINT
PRINT "Printer       : "; printer$
PRINT "Color         : "; cs$
PRINT "Graphics Mode : "; stype$
PRINT "Wheeling Sys  : "; qqq; " Numbers"
PRINT
INPUT "Is the above correct [Y]es or [N]o : ", answer$
IF answer$ = "n" OR answer$ = "N" OR answer$ = "no" OR answer$ = "NO" THEN
    GOTO start
END IF
PRINT #1, printer$
PRINT #1, cs$
PRINT #1, stype
PRINT #1, qqq
CLOSE #1
CHAIN "lotto_max"
END
