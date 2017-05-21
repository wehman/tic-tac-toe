# tic-tac-toe

# Purpose:  
creation of a tictactoe game for the console and a corresponding web application

games for -
1) two human players
2) a human versus a sequential computer
3) a human versus a random computer
4) a human versus an unbeatable computer

Major learning construct is class, which is a collection of user defined definitions.

# Programs:
app.rb - tictactoe web application

humanp.rb - get human player's move

sequentialp.rb - find computer player's next sequential available unoccupied board position

randomp.rb - find computer player's randomly chosen board position from positions not occupied

unbeatablep.rb - get next move/block for a "perfect" player

boardp.rb - affiliated board class definitions - update board, look for available positions, check for a full board, check for a winner or draw

consolep.rb - affiliated console game class definitions - draw the game board, change players, obtain a move, update board, check game winner or tie, display game status

playgamep.rb - obtain game type (human vs. human, human vs. sequential computer, human vs. random computer, human vs. unbeatable computer) and player's marker (X or O)

# Program flaw - when board space one is occupied and one tries to overwrite the marker, logic places opponent's marker in the last board space