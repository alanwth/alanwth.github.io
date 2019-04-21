#include <stdio.h>
#include <math.h>
#include <cs50.h>

int main()
{
    int cents;

    do
    {
        float cash_owed = get_float("Change owed: ");
 //Converting dollars into coins for easier calculation
        cents = round(cash_owed * 100);
    }
    while (cents <= 0);

//Count how many of each coins are needed
    int quarts = cents / 25;
    int dimes = (cents % 25) / 10;
    int nickels = ((cents % 25) % 10) / 5;
    int pennies = ((cents % 25) % 10) % 5;


//Output the number of coins needed
    printf("%d\n", quarts + dimes + nickels + pennies);
}
