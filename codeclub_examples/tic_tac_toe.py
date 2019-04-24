def tic_tac_toe():
    board = [None] + list(range(1, 10))
    WIN_COMBINATIONS = [
       (1, 2, 3), (4, 5, 6), (7, 8, 9),
       (1, 4, 7), (2, 5, 8), (3, 6, 9),
       (1, 5, 9), (3, 5, 7),
    ]


    def draw():
        print(str(board[1] )+ '|' + str(board[2]) + '|' + str(board[3]))
        print('-+-+-')
        print(str(board[4] )+ '|' + str(board[5]) + '|' + str(board[6]))
        print('-+-+-')
        print(str(board[7] )+ '|' + str(board[8]) + '|' + str(board[9]))
        print('-+-+-')

    def choose_number():
        while True:
            try:
                a = int(input())
                if a in board:
                    return a
                else:
                    print("\nInvalid move. Try again")
            except ValueError:
               print("\nThat's not a number. Try again")

    def is_game_over():
        for a, b, c in WIN_COMBINATIONS:
            if board[a] == board[b] == board[c]:
                print("Player {0} wins!\n".format(board[a]))
                print("Congratulations!\n")
                return True
        if 9 == sum((pos == 'X' or pos == 'O') for pos in board):
            print("The game ends in a tie\n")
            return True

    for player in 'XO' * 9:
        draw()
        if is_game_over():
            break
        print("Player {0} pick your move: ".format(player))
        board[choose_number()] = player
        print()

while True:
    tic_tac_toe()
    if input("Play again (y/n)\n") != "y":
        break
