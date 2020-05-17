class Card {
  PImage cardImage;
  int show =0; //determines whether the front or back is shown
  int cardX = 0;
  int cardY= 0;
  int faceValue = 0;
  String img1 = "cardBack.png";
  String img;
  int col=0; //G value to indicate which player flipped the card.


  Card(int x, int y, int fv)
  {
    cardX = x;
    cardY= y;
    faceValue = fv;
    img = Integer.toString(fv)+".png";
  }

  void displayCard() {
    if (show==0) {
      cardImage = loadImage(img1);
      image(cardImage, cardX, cardY);
    } else {
      cardImage = loadImage(img);
      image(cardImage, cardX, cardY);
      fill(0, col, 0);
      rect(cardX, cardY, 10, 10);
    }
  }
}
