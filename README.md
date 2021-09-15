  Ruby script that will take in a hash of the details to all your loans, e.g.
```
{
  title: "Sallie Mae",
  interest_rate: 0.065,
  original_balance: 10000,
  current_balance: 10000,
  min_payment: 200
},
{
  ...
}
```
   With that information, you can run the script with one input (how much you
   budget towards debt) and it will spit out how many months it will take to pay
   off all of your debt using the avalanche method (however, could be tweaked easily
   to use the snowball method).  These methods are just what debts get paid first with
   any spare money you have each month.


Here is an example scenario and output:

```
Paying $1133 in minimum payments
Total debt: $59143.6
Paying an extra $300 a month
Totalling $1433 a month

===== MONTH 1, current_total: $59143.6 =====

===== MONTH 2, current_total: $58029.27 =====

===== MONTH 3, current_total: $56903.76 =====

===== MONTH 4, current_total: $55766.9 =====

===== MONTH 5, current_total: $54618.49 =====

===== MONTH 6, current_total: $53458.4 =====

===== MONTH 7, current_total: $52286.44 =====

===== MONTH 8, current_total: $51102.43 =====

===== MONTH 9, current_total: $49906.18 =====

===== MONTH 10, current_total: $48697.51 =====

===== MONTH 11, current_total: $47476.23 =====

===== MONTH 12, current_total: $46242.17 =====

===== MONTH 13, current_total: $44995.14 =====

===== MONTH 14, current_total: $43734.92 =====

===== MONTH 15, current_total: $42461.3 =====

===== MONTH 16, current_total: $41181.07 =====

===== MONTH 17, current_total: $39895.87 =====

===== MONTH 18, current_total: $38605.68 =====

===== MONTH 19, current_total: $37310.48 =====

===== MONTH 20, current_total: $36010.23 =====

===== MONTH 21, current_total: $34704.92 =====

===== MONTH 22, current_total: $33394.38 =====

===== MONTH 23, current_total: $32078.56 =====

===== MONTH 24, current_total: $30757.43 =====

===== MONTH 25, current_total: $29430.98 =====

===== MONTH 26, current_total: $28099.17 =====

===== MONTH 27, current_total: $26762.0 =====

===== MONTH 28, current_total: $25419.43 =====

===== MONTH 29, current_total: $24071.44 =====

===== MONTH 30, current_total: $22718.02 =====

===== MONTH 31, current_total: $21359.13 =====

===== MONTH 32, current_total: $19994.76 =====

===== MONTH 33, current_total: $18624.88 =====

===== MONTH 34, current_total: $17249.47 =====

===== MONTH 35, current_total: $15868.52 =====

===== MONTH 36, current_total: $14482.03 =====

===== MONTH 37, current_total: $13089.95 =====

===== MONTH 38, current_total: $11692.28 =====

===== MONTH 39, current_total: $10289.09 =====

===== MONTH 40, current_total: $8881.86 =====

===== MONTH 41, current_total: $7470.56 =====

===== MONTH 42, current_total: $6055.43 =====

===== MONTH 43, current_total: $4636.91 =====

===== MONTH 44, current_total: $3215.0 =====

===== MONTH 45, current_total: $1789.69 =====

===== MONTH 46, current_total: $360.97 =====

Total months to total debt payoff: 46 (3.83 years)
Total starting debt: 70457.59999999999

Capital One:
  Original balance: $8000
  Current balance:  $0
  Minimum payment:  $350
  Interest paid:    $978.17
  Interest rate:    21.0%
  Paid off at:      14 months


Cody Loans:
  Original balance: $23000
  Current balance:  $0
  Minimum payment:  $240
  Interest paid:    $2133.0999999999995
  Interest rate:    5.0%
  Paid off at:      33 months


Aspire:
  Original balance: $8942.45
  Current balance:  $0
  Minimum payment:  $99
  Interest paid:    $918.97
  Interest rate:    4.9799999999999995%
  Paid off at:      37 months


OSLA:
  Original balance: $12654.15
  Current balance:  $0
  Minimum payment:  $286
  Interest paid:    $188.98999999999998
  Interest rate:    4.2%
  Paid off at:      20 months


Aspire 2:
  Original balance: $7870.42
  Current balance:  $0
  Minimum payment:  $99
  Interest paid:    $592.7199999999999
  Interest rate:    3.4799999999999995%
  Paid off at:      40 months


Navient:
  Original balance: $9990.58
  Current balance:  $0
  Minimum payment:  $59
  Interest paid:    $891.2800000000001
  Interest rate:    2.87%
  Paid off at:      46 months
```
