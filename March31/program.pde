void setup() {
  size(1000, 1000); //set the canvas size
  background(255); //set the background color to white
}


void horizontalLines(int x1, int y1, int x2, int y2, int lines, float space, float thick) {//function creates a set of horizontal lines based on the given arguments
  strokeWeight(thick); //how thick the lines will be
  stroke(0); //set the line color to black
  for (int i = 0; i<lines; i++) {
    line(x1, y1 + (i*space), x2, y2 + (i*space) ); //draw the line and increment by space value given to add the second line in the next loop and so on
  }
}

void verticalLines(int x1, int y1, int x2, int y2, int lines, float space, float thick) { //function creates a set of vertical lines based on the given arguments
  strokeWeight(thick); //how thick the lines will be
  stroke(0); //set the line color to black
  for (int i = 0; i<lines; i++) {
    line(x1 + (i*space), y1, x2 + (i*space), y2 ); //draw the line and increment by space value given to add the second line in the next loop and so on
  }
} 


void draw() {

  //horizontal lines
  horizontalLines(150, 300, 340, 300, 56, 3, 0); //left most lines

  push();
  translate(355, 350);
  horizontalLines(0, 0, 140, 0, 24, 6, 0); //translated the previous lines to the right and down (slightly wider)
  pop();

  push();
  translate(340, 100);
  horizontalLines(0, 0, 100, 0, 20, 5, 0); //translated the previous lines to the left and up (less wide)
  pop();

  push();
  translate(565, 10);
  horizontalLines(0, 0, 40, 0, 22, 8, 2); //translated the previous lines to the right and up (less wide)
  pop();  

  push();
  translate(550, 150);
  horizontalLines(0, 0, 75, 0, 35, 8, 2); //translated the previous lines to the left and down (slightly wider)
  pop();  

  push();
  translate(650, 520);
  horizontalLines(0, 0, 160, 0, 40, 8, 1); //translated the previous lines to the right and down (wider)
  pop();  

  //vertical lines
  verticalLines(290, 600, 290, 800, 28, 7, 1.1); //bottom most lines

  push(); 
  translate(355, 250);
  verticalLines(0, 0, 0, 380, 20, 3.5, 0); //above the bottom lines (skinny)
  pop();

  push();
  translate(330, 200);
  verticalLines(0, 0, 0, 320, 35, 7, 1);//overlapping the previous linews and further up (wider)
  pop();

  push();
  translate(300, 130);
  verticalLines(0, 0, 0, 220, 25, 4, 0);//overlapping the previous two lines translated to the right and up (skinny)
  pop();

  push();
  translate(340, 20);
  verticalLines(0, 0, 0, 220, 40, 5, 1);//overlapping the previous two lines translated to the left and up (wider) (top most)
  pop();

  push();
  translate(590, 100);
  verticalLines(0, 0, 0, 250, 30, 3.5, 0);//translated the previous lines to the right and down (skinny)
  pop();

  push();
  translate(650, 80);
  verticalLines(0, 0, 0, 150, 25, 3.5, 1.5);//translated the previous lines to the right and up (skinny)
  pop(); 

  push();
  translate(700, 600);
  verticalLines(0, 0, 0, 150, 20, 8, 2);//translated the previous lines to the right and down (wider)
  pop();   


  //rectangles
  fill(0); //all black
  rect(100, 550, 200, 10); //left most rectangle

  push();
  translate(370, 530);
  rotate(radians(90));  //keeps it vertical
  fill(0);
  rect(0, 0, 200, 20); //roated 90 degrees and to the right (slightly wider)
  pop();

  push();
  translate(625, 330);
  rotate(radians(90));  //keeps it vertical
  fill(0);
  rect(0, 0, 300, -100); //translated to the right and up (wider)
  pop();

  push();
  translate(680, 600);
  rotate(radians(90));  //keeps it vertical
  fill(0);
  rect(0, 0, 150, -2); //translated the previous shape to the right and down (skinny)
  pop();


  push();
  translate(750, 250);
  rotate(radians(90)); //keeps it vertical
  fill(0);
  rect(0, 0, 300, -20); //translated the previous shape to the right and up (wider)
  pop();


  push();
  translate(780, 100);
  rotate(radians(90));  //keeps it vertical
  fill(0);
  rect(0, 0, 300, -40); //translated the previous shape to the right and up (wider)
  pop();
}
