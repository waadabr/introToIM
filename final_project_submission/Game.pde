class Game {
  Card[][] myCard = new Card[8][5]; // a 2D array to hold the cards.
  IntList cardvalues = new IntList(0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 
    11, 12, 13, 14, 15, 16, 17, 18, 19); // a list that helps shuffle the cards in the deck
  Card[] cards = new Card[3]; //an array to hold cards temporarily to compare their images
  int count = -1;
  String[] players = {"Player 1", "Player 2"};
  int playerturn = 0;
  int[] score = {0, 0};


  boolean gameOver() {
    if (score[0]+score[1] == 20) {
      if (score[0] >score[1]) {
        println("player 1 has won!");
      } else {
        println("player2 has won!");
      }
      return true;
    }
    return false;
  }

  void Deck() {
    cardvalues.shuffle();
    int k = 0; // to index cardvalues 
    for (int i =0; i<8; i++) {
      for (int j= 0; j<5; j++) {
        myCard[i][j]= new Card(j*100, i*100, cardvalues.get(k));
        k = (k+1)%20;
        if (k == 0) {//reshffle values before loading next 20 cards.
          cardvalues.shuffle();
        }
      }
    }
  }

  Card getCard(int x, int y) {
    return myCard[x][y];
  }

  void play() {
    if (mousePressed==true) {
      if (!gameOver()) {
        println(Integer.toString(playerturn) + ';'+ Integer.toString(score[playerturn]));
        int x = int(mouseX/100);
        int y = int(mouseY/100);
        if (getCard(y, x).show !=1) //if the card is not flipped already
        {
          getCard(y, x).show =1;//flip card
          cards[++count] = getCard(y, x); //hold flipped card in the temporary holding array
          //count = (count+1) % 3;
        }
        //println(count);
        if (count==2)//if there are three cards in the array, compare the last two cards.
        {
          if (cards[0].faceValue == cards[1].faceValue) {//if player 2 flips two same cards, put a black rectangle at left top
            score[playerturn] = score[playerturn]+1; //increase the score of whichever player is playing
            if (playerturn==0) {
              cards[0].col=255;
              cards[0].col=255;
            } else if (playerturn==1) {//if player 2 flips two same cards, put a black rectangle at left top
              cards[0].col=0;
              cards[0].col=0;
            }
            cards[0].show = 1;
            cards[1].show = 1;
            count=-1;
            cards[++count]=cards[2];//make the third card the first card in the array.
          } else {
            cards[0].show = 0; 
            cards[1].show = 0;
            count=-1;
            cards[++count]=cards[2];
          }

          playerturn = (playerturn+1)%2; //change player
        }
      } 
      else {
        message("GameOver\n" + players[playerturn] + " has won! \nPress Enter to restart.");
      }
    }
  }

  void message(String m) {
    PFont f; 
    color green;
    float x, y;
    f = createFont("Arial", 32); //define the font
    textFont(f, 32); 

    x=250; //identify where it should be placed on x and y coordinate
    y=300;

    fill(255);
    textAlign(CENTER); //align it to the center
    text(m, x, y); //print the text on the screen
  }

  void display() {
    for (int i= 0; i<8; i++) {
      for (int j= 0; j<5; j++) {
        myCard[i][j].displayCard();
      }
    }
  }
}
