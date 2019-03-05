#!/bin/python3

from random import randint

# Player's input
# To check the input is valid
player = 0
while player not in ('r', 'p', 's'):
    player = input('rock (r), paper (p) or scissors (s)')

print(player, 'vs', end=' ')

# Comupter's turn
chosen = randint(1, 3)

# Assigning 1 to rock, 2 to paper and 3 to scissors
if chosen == 1:
    computer = 'r'

elif chosen == 2:
    computer = 'p'

else:
    computer = 's'

print(computer)

# Check and print result
if player == computer:
    print("DRAW")

elif player == 'r' and computer == 's':
    print("WIN")

elif player == 'p' and computer == 'r':
    print("WIN")

elif player == 's' and computer == 'p':
    print("WIN")

elif player:
    print("LOSE")
