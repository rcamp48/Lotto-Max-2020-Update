'function GETDAYNAME parameters: YEAR, MONTH, DAY
'listing of Tuesdays and Thursdays for 40 years

d = __GETDAY - 1
DIM SHARED VirtualYear
VirtualYear = 2018

FOR l = 1 TO 366 * 40
    d = d + 1
    IF ISLEAPYEAR(VirtualYear) AND d > 366 THEN VirtualYear = VirtualYear + 1: d = d - 366
    IF ISLEAPYEAR(VirtualYear) = 0 AND d > 365 THEN VirtualYear = VirtualYear + 1: d = d - 365
    today$ = ""
    DO UNTIL today$ = "Friday" OR today$ = "Tuesday"
        today$ = GETDAYNAME(VirtualYear, 1, d)
        d = d + 1
    LOOP
    d = d - 1
    day = GETDAYNR(VirtualYear, 1, d)
    realdate$ = GETDATE$(day, VirtualYear)

    PRINT "Next date is "; realdate$; " "; GETDAYNAME(VirtualYear, 1, d)
    SLEEP
NEXT






FUNCTION GETDAYNR (y, m, d) 'insert year, month and day and function calculate which day in year it is
    FOR month = 1 TO m
        IF ISLEAPYEAR(y) = 0 THEN
            SELECT CASE month
                CASE 1: m = 31
                CASE 2: m = 28
                CASE 3: m = 31
                CASE 4: m = 30
                CASE 5: m = 31
                CASE 6: m = 30
                CASE 7: m = 31
                CASE 8: m = 31
                CASE 9: m = 30
                CASE 10: m = 31
                CASE 11: m = 30
                CASE 12: m = 31
            END SELECT
        ELSE
            SELECT CASE month
                CASE 1: m = 31
                CASE 2: m = 29
                CASE 3: m = 31
                CASE 4: m = 30
                CASE 5: m = 31
                CASE 6: m = 30
                CASE 7: m = 31
                CASE 8: m = 31
                CASE 9: m = 30
                CASE 10: m = 31
                CASE 11: m = 30
                CASE 12: m = 31
            END SELECT
        END IF
        GETDAYNR = GETDAYNR + m
    NEXT
    GETDAYNR = GETDAYNR - (m - d)
END FUNCTION

FUNCTION __GETDAY
    __GETDAY = VAL(MID$(DATE$, 4, 2))
END FUNCTION


FUNCTION GETDATE$ (NrOfTheDayInYear, y) 'return date 'YYYYMMDD in year y

    'spocitat mesic
    FOR month = 1 TO 12
        IF ISLEAPYEAR(y) = 0 THEN
            SELECT CASE month
                CASE 1: m = 31
                CASE 2: m = 28
                CASE 3: m = 31
                CASE 4: m = 30
                CASE 5: m = 31
                CASE 6: m = 30
                CASE 7: m = 31
                CASE 8: m = 31
                CASE 9: m = 30
                CASE 10: m = 31
                CASE 11: m = 30
                CASE 12: m = 31
            END SELECT
        ELSE
            SELECT CASE month
                CASE 1: m = 31
                CASE 2: m = 29
                CASE 3: m = 31
                CASE 4: m = 30
                CASE 5: m = 31
                CASE 6: m = 30
                CASE 7: m = 31
                CASE 8: m = 31
                CASE 9: m = 30
                CASE 10: m = 31
                CASE 11: m = 30
                CASE 12: m = 31
            END SELECT
        END IF
        oldm = om
        om = om + m
        IF om >= NrOfTheDayInYear AND oldm < NrOfTheDayInYear THEN EXIT FOR
    NEXT
    day = NrOfTheDayInYear - om + m
    day$ = STR$(day): IF LEN(day$) < 3 THEN day$ = "0" + LTRIM$(day$)
    month$ = STR$(month): IF LEN(month$) < 3 THEN month$ = "0" + LTRIM$(month$)

    GETDATE$ = LTRIM$(STR$(y)) + "-" + LTRIM$(month$) + "-" + LTRIM$(day$)
END FUNCTION




FUNCTION ISLEAPYEAR (year)
    IF year MOD 4 = 0 AND year MOD 100 THEN ISLEAPYEAR = 1
    IF year MOD 100 = 0 AND year MOD 400 = 0 THEN ISLEAPYEAR = 1
END FUNCTION

FUNCTION GETDAYNAME$ (year, month, day) 'otestovano brutalne, fuguje skutecne spravne!
    '  IF year < 1900 THEN GETDAYNAME$ = "Invalid Year ( <1900 ).": EXIT FUNCTION
    'spocitat pocet mesicu od ledna 1900:
    DIM om AS LONG, m AS LONG, days AS LONG
    days = day
    FOR yyr = 1 TO year
        IF yyr = year THEN monthend = month ELSE monthend = 12
        FOR mont = 1 TO monthend
            IF ISLEAPYEAR(yyr) = 0 THEN
                SELECT CASE mont
                    CASE 1: m = 31
                    CASE 2: m = 28
                    CASE 3: m = 31
                    CASE 4: m = 30
                    CASE 5: m = 31
                    CASE 6: m = 30
                    CASE 7: m = 31
                    CASE 8: m = 31
                    CASE 9: m = 30
                    CASE 10: m = 31
                    CASE 11: m = 30
                    CASE 12: m = 31
                END SELECT
            ELSE
                SELECT CASE mont
                    CASE 1: m = 31
                    CASE 2: m = 29
                    CASE 3: m = 31
                    CASE 4: m = 30
                    CASE 5: m = 31
                    CASE 6: m = 30
                    CASE 7: m = 31
                    CASE 8: m = 31
                    CASE 9: m = 30
                    CASE 10: m = 31
                    CASE 11: m = 30
                    CASE 12: m = 31
                END SELECT
            END IF
            om = m
            days = days + m
        NEXT
    NEXT
    days = days - m - 1
    '  PRINT "Dnu:"; Days
    a = (days MOD 7) '0 = pondeli
    RESTORE nms
    FOR r = 0 TO a
        READ GETDAYNAME$
    NEXT
    nms:
    DATA Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday
END FUNCTION


FUNCTION GetDay$ (mm, dd, yyyy) 'use 4 digit year
    'From Zeller's congruence: https://en.wikipedia.org/wiki/Zeller%27s_congruence
    IF mm < 3 THEN mm = mm + 12: yyyy = yyyy - 1
    century = yyyy MOD 100
    zerocentury = yyyy \ 100
    result = (dd + INT(13 * (mm + 1) / 5) + century + INT(century / 4) + INT(zerocentury / 4) + 5 * zerocentury) MOD 7
    SELECT CASE result
        CASE 0: GetDay$ = "Saturday"
        CASE 1: GetDay$ = "Sunday"
        CASE 2: GetDay$ = "Monday"
        CASE 3: GetDay$ = "Tuesday"
        CASE 4: GetDay$ = "Wednesday"
        CASE 5: GetDay$ = "Thursday"
        CASE 6: GetDay$ = "Friday"
    END SELECT
END FUNCTION




