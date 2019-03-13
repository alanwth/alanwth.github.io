# -*- coding: utf-8 -*-
from random import randint
count=0
while True:
    player1=input("Rock, paper or scissors? Enter r, p or s:")#this is not allowing the player to type anything other than r,p or s
    options=("r","p","s")
    while player1 not in options:
        player1 = input("Please enter r, p or s:")
    
    #This is generating a random number for the outcome of the outcome of the computer to be different.
    random=randint(1,3)
    if random==1:
        player2="r"
    if random==2:
        player2="p"
    if random==3:
        player2="s"
    print(player1 + " v "+ player2)
        
    if player1==player2:
        print("It's a draw!")
    
    if player1=="r" and player2=="p":
        print("Player 2 wins")
        
    if player1=="r" and player2=="s":
        print("Player 1 wins")
        
    if player1=="s" and player2=="p":
        print("Player 1 wins")
        
    if player1=="s" and player2=="r":
        print("Player 2 wins")
        
    if player1=="p" and player2=="r":
        print("Player 1 wins")
        
    if player1=="p" and player2=="s":
        print("Player 2 wins")
    count+=1#this counts how many times youve played and gives you the option to continue or stop playing
    if count%5==0:
        bob=input("Play again? (y/n):")
        if bob=="y":
            continue
        if bob=="n":
            break
