Game myGame;

void setup() {
  size(500, 800);
  myGame = new Game();
  myGame.Deck();
}
boolean h = true;

void draw() {
  background(0);
  myGame.display();
  myGame.play();
}

void keyPressed() {
  if (key == ENTER) { //if the ENTER key is clicked the game will automatically restart with it being the next players turn
    setup(); //calls the setup function again to restart
  }
}
