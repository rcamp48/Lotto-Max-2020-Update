getdate:
d1 = __GETDAY - 1

VirtualYear = y

FOR l = 1 TO 366 * 40
    d1 = d1 + 1
    IF ISLEAPYEAR(VirtualYear) AND d1 > 366 THEN VirtualYear = VirtualYear + 1: d1 = d1 - 366
    IF ISLEAPYEAR(VirtualYear) = 0 AND d1 > 365 THEN VirtualYear = VirtualYear + 1: d1 = d1 - 365
    today$ = ""
    DO UNTIL today$ = "Friday" OR today$ = "Tuesday"
        today$ = GETDAYNAME(VirtualYear, 1, d1)
        d1 = d1 + 1
    LOOP
    d1 = d1 - 1
    day = GETDAYNR(VirtualYear, 1, d1)
    realdate$ = GETDATE$(day, VirtualYear)
    IF today$ = "Friday" AND count = -1 THEN LASTDAY = -3
    IF today$ = "Tuesday" AND count = -1 THEN LASTDAY = -4
    IF today$ = "Friday" OR today$ = "Tuesday" THEN EXIT FOR
NEXT
RETURN

