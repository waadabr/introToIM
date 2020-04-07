
class TicTacToe {
  int roundCount = 0; //keeps track of how many rounds; max of 9
  int position =0; //keeps track of which player in the array currentPlayers
  PImage X; //define image of 'x' for player1
  PImage O; //define image of 'o' for player2
  String[] currentPlayer = {"player1", "player2"}; //array holding the players in their positions 0 or 1
  char[][] hiddenBoard; //board that will mirror the one displayed to the players


  TicTacToe() { //initialize the objects 
    X = loadImage("x.png"); //loading image of 'x' for player1
    O = loadImage("o.png"); //loading image of 'o' for player2
    hiddenBoard = new char[3][3]; //creating a double array for the hidden board
    createBoard(); //calls this function
  }


  void createBoard() { //creates the board using nested for loops
    for (int i=0; i<3; i++) {
      for (int j =0; j<3; j++) {
        hiddenBoard[i][j] = ' '; //adds a space at each index position
      }
    }
  }


  void printBoard() { //prints the board in the system
    System.out.println("-------------"); //prints lines to make it look like an actual board
    for (int i = 0; i < 3; i++) { //uses the board created in the createBoard function to print the spaces at the index
      System.out.print("| ");
      for (int j = 0; j < 3; j++) {
        System.out.print(hiddenBoard[i][j] + " | ");
      }
      System.out.println();
      System.out.println("-------------"); 
    }
  }


  void displayBoard() { //displayes the board on the screen for the player
    strokeWeight(6); //thicker line 
    line(200, 0, 200, 600); //first horizontal line
    line(400, 0, 400, 600); //second horizontal line
    line(0, 200, 600, 200); //first vertical line
    line(0, 400, 600, 400); //second vertical line
  }



  boolean checkForWin(char player) { //checks to see if any of the players have won
    int win=0; //keeps track of how many consecutive 'x' or 'o' found 
    for (int row=0; row<3; row++) { //checks horizontally by keeping row constant and looping through the columns to see if there is a consecutive match
      for (int col =0; col<3; col++) {
        if (hiddenBoard[row][col] == player) {
          win++;
        }
      }
      if (win == 3) {
        return true; //if there is a match 3 in a row then return true
      } else win=0; //otherwise reset win to 0 to start counting the consecutive matches again
    }

    win=0;
    for (int col=0; col<3; col++) { //checks vertically by keeping the columns constant and looping through the rows to see if there is a consecutive match
      for (int row =0; row<3; row++) {
        if (hiddenBoard[row][col] == player) { //check if it matches
          win++;
        }
      }
      if (win == 3) {
        return true; //if there is a match 3 in a row then return true
      } else win=0; //otherwise reset win to 0 to start counting the consecutive matches again
    }

    win = 0;
    for (int rowcol=0; rowcol<3; rowcol++) { //checks diagnollay from the left
      if (hiddenBoard[rowcol][rowcol]==player) { //all diagnoal positions are the same ex. (0,0), (1,1), and 2,2 so just checks those positions
        win++;
      }
    }
    if (win == 3) {
      return true; //if there is a match 3 in a row then return true
    } else win=0;//otherwise reset win to 0 to start counting the consecutive matches again

    int col=2; //set column to 2 to check diagnollay from the right
    for (int row=0; row<3; row++) {
      if (hiddenBoard[row][col-row]==player) { //increment the row but decrement the column because the indexes are (0,2), (1,1), and (2, 0)
        win++;
      }
    }
    if (win == 3) {
      return true; //if there is a match 3 in a row then return true
    } else win=0; //otherwise reset win to 0 to start counting the consecutive matches again
    return false; //if no win is found, return false and continue playing until game over
  }


  void message(String m) {
    PFont f; 
    color green;
    float x, y;
    f = createFont("Arial", 32); //define the font
    textFont(f, 32); 
    green = color(50, 168, 82); //define the color of the text

    x=300; //identify where it should be placed on x and y coordinate
    y=250;

    fill(green);
    textAlign(CENTER); //align it to the center
    text(m, x, y); //print the text on the screen
  }



  void play() {
    if (mousePressed == true) { //true if the mouse is clicked
      int x=mouseX/200; //identifies the x coordinate of where the mouse was clicked and turns it into an index (0,1 or 2)
      int y = mouseY/200; //identifies the y coordinate of where the mouse was clicked and turns it into an index (0,1 or 2)
      if (hiddenBoard[x][y]!= 'x' && hiddenBoard[x][y]!='o') { //checks to see if anything is present in that space on the hiddenboard
        if (currentPlayer[position] == "player1") { //if not then the player can play and place their mark in that position
          hiddenBoard[x][y] = 'x'; //player1's mark is 'x'
          image(X, x*200, y*200); //the players mark will appear on that position on the board
          roundCount++; //increments to keep track of how many rounds; max 9
          position=(position+1)%2; //alternates to the next player in the array currentPlayer
          printBoard(); //prints the board in the system
          if (checkForWin('x')==true && (roundCount <10)) {//checks to see if a player has won or if the game is draw because 9 rounds have been completed
            System.out.println("GameOver\nPlayer 1 Won"); //print message in system
            message("GameOver\nPlayer 1 Won\nPress Enter to restart."); //prints out message on the screen for the winning player and restart by clicking ENTER
          }
        } else if (currentPlayer[position] == "player2" ) {  //the player can play and place their mark in that position
          hiddenBoard[x][y] = 'o'; //player2's mark is 'o'
          image(O, x*200, y*200); //first box in the first row
          position=(position+1)%2; //alternates to the next player in the array currentPlayer
          roundCount++; //increments to keep track of how many rounds; max 9
          printBoard(); //prints the board in the system
          if (checkForWin('o')==true  && (roundCount <10)) { //checks to see if a player has won or if the game is draw because 9 rounds have been completed
            System.out.println("GameOver\nPlayer 2 Won"); //print message in system
            message("GameOver\nPlayer 2 Won\nPress Enter to restart.");  //prints out message on the screen for the winning player and restart by clicking ENTER
          }
        }
        if (roundCount == 9) { //game is over; 9 rounds have been played
          System.out.println("GameOver"); //print message in system
          message("GameOver\nPress Enter to restart."); //prints out message on the screen that it is a draw and restart by clicking ENTER
        }
      }
    }
  }
}





TicTacToe game; //create the object null

void setup() {
  size(600, 600); //set the screen size
  background(255); //set the background color to white
  game = new TicTacToe(); //redefine the object and initialize it for use
}


void draw() {
  game.displayBoard(); //display the board for the players
  game.play(); //begin the game
}


void keyPressed() {
  if (key == ENTER) { //if the ENTER key is clicked the game will automatically restart with it being the next players turn
    setup(); //calls the setup function again to restart
  }
}

