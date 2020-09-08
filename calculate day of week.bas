
' How to determine the day of the week, given the month day and year.
'
' (1) Take the last two digits of the year.
' (2) Divide by 4, discarding any fraction.
' (3) Add the day of the month.
' (4) Add the month's key value : JFM AMJ JAS OND 144 025 036 146
' (5) Subtract 1 for January or February of a leap year.
' (6) For a Gregorian date, add 0 for 1900s, 6 for 2000s,  4 for 1700s , and 1 for each additional century
' that you go back.
' (7) For a Julian date , add 1 for 1700s , and 1 for every century that you g back.
' (8) Add the last 2 digits of the year.
' (9) Divide by 7 and take the remainder.
'


'
'Now 1 is Sunday, the first day of the week, 2 is Monday, and so on.
'



' Instructions taken from a post from University of Waterloo, Waterloo, Ontario, Canada





'
DIM month AS INTEGER '                         Declare month as an INTEGER variable.
DIM day AS INTEGER '                           Declare day as an INTEGER variable.
DIM year AS INTEGER '                          Declare year as an INTEGER variable.
DIM year12 AS INTEGER
DIM year34 AS INTEGER
DIM day_of_week(7) AS STRING '                    Declare day_of_week as a STRING variable.
DIM key_values(12) AS INTEGER '               Declare key_values as an INTEGER variable.
DIM gregorian(4) AS INTEGER
DIM i AS INTEGER ' Read in the key values of each month with a READ statement getting DATA for a data set called  key_value.
DIM j AS INTEGER
DIM k AS INTEGER



' Read in the names of the week for each day with a READ statement getting DATA for a data set called day_of_week.


FOR i = 1 TO 7
    READ day_of_week(i)
NEXT i

FOR j = 1 TO 12
    READ key_values(j)
NEXT j

FOR k = 1 TO 4
    READ gregorian(k)
NEXT k

start:


'My introduction.


CLS
PRINT
PRINT "This program will take any date from year 1 to year 9999"
PRINT "and tell you what day that date occured on."
PRINT
PRINT "Program written and documented by Russ Campbell"
PRINT "for QB64.ORG as a lesson for anyone to learn how"
PRINT "to write a simple (not so simple program) in QB64"
PRINT "on April 16th 2019 at 6:00 AM using QB64 32 bit"
PRINT "version to keep everything compatable."
PRINT


PRINT "Biography: I have been writing programs in first"
PRINT "           Quick Basic , then Quick Basic 4.5 with"
PRINT "compiler and now Quick Basic 64 made for modern "
PRINT "computers that are 64 bit, and of course older"
PRINT "computers that are 32 bit."
PRINT


' Start the progam with a keyboard input of month , day and year.


INPUT "Month : ", month
INPUT "Day   : ", day
INPUT "Year  : ", year


PRINT
PRINT "That was : "; days_of_week(total); "   "; month; "  "; day; "  "; year



PRINT "Do you wish to try this again :   " '  Ask the user if they wish to run the program again.
answer$ = INPUT$(1) '                         Take the input from the keyboard.



IF answer$ = "Y" OR answer$ = "y" THEN '      If the answer is Y or the answer is y then rerun the program.
    GOTO start
END IF

'                                             Because the answer is taken directly from the keyboard
'                                             and Y or y sends the program to a label called start,
'                                             the program will end if any other key is pressed.


END ' This is where I logically end the program, all data is stored after this staetement of 'END'



'All DATA goes after this line , and because of the END statement , it cannot be accidently executed.



'                                           This statement tells the program where the key_value
'                                                             data is stored in the program.





'                                         This startment tells the program where the day_of_week
RESTORE day_of_week '                                                            data is stored in the program.
day_of_week:
DATA Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday
RETURN

RESTORE key_values
key_values:
DATA 144,144,144,25,25,25,36,36,36,146,146,146
RETURN

RESTORE gregorian
gregorian:
DATA 0,6,4,2
RETURN
