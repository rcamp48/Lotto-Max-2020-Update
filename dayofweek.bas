Start:
'Find Day of the Week
DIM n AS INTEGER
DIM n1 AS INTEGER
DIM n2 AS INTEGER
DIM n3 AS INTEGER
DIM n4 AS INTEGER
DIM d AS INTEGER
DIM m AS INTEGER
DIM y AS INTEGER
DIM b(7) AS STRING
DIM a AS INTEGER
DIM day AS INTEGER
n = 0: n1 = 0: n2 = 0: n3 = 0: n4 = 0
d = 0: m = 0: y = 0: day = 0

CLS
PRINT "Please enter the date information"
PRINT "---------------------------------"
PRINT
INPUT "Year [2019]  : ", y
PRINT
INPUT "Month [1-12] : ", m
IF (m < 1) OR m > 12 THEN GOTO Start
PRINT
INPUT "Date [1-31]  : ", d

IF (d < 1) OR (d > 31) THEN GOTO Start
IF (m = 2) AND (y MOD 4 <> 0) AND (d > 28) THEN GOTO Start
IF (m = 2) AND (y MOD 4 = 0) AND (d > 29) THEN GOTO Start


FOR a = 1 TO 7
    READ b(a)
NEXT a

n1 = FIX(3 * (m + 1) / 5)
n2 = FIX(y / 4)
n3 = FIX(y / 100)
n4 = FIX(y / 400)
n = d + (2 * m) + n1 + y + n2 - n3 + n4 + 2

day = n MOD 7
IF y = 2000 THEN a1 = 1: a2 = 2: a3 = 2: a4 = 3

IF ((y MOD 4 = 0) AND (m = 1)) THEN day = day + a1
IF ((y MOD 4 = 0) AND (m = 2)) THEN day = day + a2
IF ((y MOD 4 <> 0) AND (m = 1)) THEN day = day + a3
IF ((y MOD 4 <> 0) AND (m = 2)) THEN day = day + a4
IF day > 7 THEN day = 1

PRINT m
PRINT
PRINT
PRINT "'" + b(day) + "'", d, m, y
PRINT "____________"
PRINT
RESTORE
INPUT "Press Enter to try again and [S] to stop : "; s$
s$ = UCASE$(s$)
IF s$ = "S" THEN END ELSE GOTO Start:

DATA Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday

