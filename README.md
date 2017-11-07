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
