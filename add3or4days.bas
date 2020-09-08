'This is an update to the find day of week program.
'it is used to automatically enter the next draw date
'for my Lotto 649 Programs winning numbers update.
'code added by Russ Campbell.

DIM n AS INTEGER
DIM n1 AS INTEGER
DIM n2 AS INTEGER
DIM n3 AS INTEGER
DIM n4 AS INTEGER
DIM dy AS INTEGER
DIM m AS INTEGER
DIM y AS INTEGER
DIM bay(7) AS STRING
DIM a1 AS INTEGER
DIM day1 AS INTEGER
DIM adddays AS INTEGER
FOR a1 = 0 TO 6
    READ bay(a1)
NEXT a1
RESTORE dayofweek
enterdate:

'Find Day of the Week

n = 0: n1 = 0: n2 = 0: n3 = 0: n4 = 0
n1 = FIX(3 * (m + 1) / 5)
n2 = FIX(y / 4)
n3 = FIX(y / 100)
n4 = FIX(y / 400)


n = dy + (2 * m) + n1 + y + n2 - n3 + n4 + 2

day1 = n MOD 7

IF ((y MOD 4 = 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 = 3) AND (m = 2)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 2)) THEN day1 = day1 + 2
IF day1 > 6 THEN day1 = 0
IF bay(day1) = "Sat" AND count = 1 THEN
    adddays = 4
    dy = dy + adddays
ELSEIF bay(day1) = "Wed" AND count = 1 THEN
    adddays = 3
    day1 = day1 + adddays
ELSEIF bay(day1) = "Sat" AND count = -1 THEN
    adddays = -3
    day1 = day1 + adddays
ELSEIF bay(day1) = "Wed" AND count = -1 THEN
    adddays = -4
    day1 = day1 + adddays
ELSEIF bay(day1) = "Sat" AND count = 0 THEN
    adddays = 0
    day1 = day1 + adddays
ELSEIF bay(day1) = "Wed" AND count = 0 THEN
    adddays = 0
    day1 = day1 + adddays
END IF
IF day1 > 6 THEN day1 = 0

'Add 3 or 4 days to the day of week


n1 = FIX(3 * (m + 1) / 5)
n2 = FIX(y / 4)
n3 = FIX(y / 100)
n4 = FIX(y / 400)


n = dy + (2 * m) + n1 + y + n2 - n3 + n4 + 2

day1 = n MOD 7

IF ((y MOD 4 = 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 = 3) AND (m = 2)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 1)) THEN day1 = day1 + 2
IF ((y MOD 4 <> 3) AND (m = 2)) THEN day1 = day1 + 2
IF day1 > 6 THEN day1 = 0

RETURN
dayofweek:
DATA Sat,Sun,Mon,Tue,Wed,Thu,Fri
RETURN

