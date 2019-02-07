// Promt user for a height between 0 and 23
// Print the pyramid of the desire height with two spaces inbetween

#include <cs50.h>
#include <stdio.h>

int main(void)
{
    int rows;

    // Prompt user for a height between 0 and 23
    do
    {
        printf("Enter height of pyramid: ");
        rows = get_int();
    }
    while (rows < 0 || rows > 23);

    // Going through each rows
    for (int height = 0; height < rows; height++)
    {
        // Printing the number of spaces on the left
        for (int spaces =  0; spaces < rows - height - 1; spaces++)
        {
            printf(" ");

        }
        // Printing the hashes on the left
        for (int hashes1 = 0; hashes1 < height + 1; hashes1 ++)
        {
            printf("#");
        }
        // The space in the middle
        printf(" ");

        // Printing the hashes on the right
        for (int hashes2 = 0; hashes2 < height + 1; hashes2 ++)
        {
            printf("#");
        }

        printf("\n");
    }
}
