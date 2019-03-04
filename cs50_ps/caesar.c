// Promt user for a key and plaintext
// Convert plaintext into alphabet index
// Encrypt the plaintext using the key and obtain the ciphertext
// Note that Uppercase letters are different from that of Lowercase
// Print out the ciphertext

#include <ctype.h>
#include <cs50.h>
#include <stdio.h>
#include <string.h>
#define ALPHABET 26

int main(int argc, string argv[])
{
    // Promt user for an argument consists of [0] : ./caesar, [1] : key, [2] : plaintext
    while (argc != 2)
    {
        printf("Enter two arguments.\n");
        return 1;
    }
    // Convert argument [1] from string to int
    int key = atoi(argv[1]);

    // Promt user for plain plaintext
    string plaintext = get_string("plaintext: ");

    printf("ciphertext: ");

    for (int i = 0; i < strlen(plaintext) ; i++)
    {
         // Checking if plaintext is uppercase
        if (isupper(plaintext[i]))
        {
            // Deduct 'A' from plaintext to get alphabet index,then add key for encryption module by ALPHABET and add back 'A' to get back ASCII value

            printf("%c", (((plaintext[i] - 'A' + key) % ALPHABET) + 'A'));
        }
        // Checking if plaintext is lowercase
        else if (islower(plaintext[i]))
        {
            // Same process for upper looped character, but 'a' instead of 'A'
            printf("%c", (((plaintext[i] - 'a' + key) % ALPHABET) + 'a'));
        }

        else
        {
            printf("%c", plaintext[i]);
        }

    }
    printf("\n");
}
