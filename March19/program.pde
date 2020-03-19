void setup() {

  size(1000, 1000);
  background(255, 182, 193); //light pink
}

void draw() {

  if (mousePressed == true) {
    fill(204, 255, 229); //light green
  } else { 
    fill(204, 229, 295); //light blue
  }

  ellipse(500, 350, 500, 600); //scarf
  quad(650, 600, 780, 800, 350, 600, 240, 800); //crossed trapazoid shape (tie of the scarf)

  fill (141, 85, 36); //brown
  ellipse(500, 350, 400, 500); //head


  fill(0); //black
  ellipse(415, 275, 70, 50); //left eyelid
  ellipse(575, 275, 70, 50); //right eyelid


  fill(255); //white
  ellipse(415, 275, 60, 40); //left eye
  ellipse(575, 275, 60, 40); //right eye

  if (mousePressed == true) {
    fill(204, 255, 229); //light green
  } else { 
    fill(204, 229, 295); //light blue
  }
  
  ellipse(415, 275, 30, 30); //left pupil
  ellipse(575, 275, 30, 30); //right pupil


  noFill(); //no color
  ellipse(500, 370, 50, 70); //nose


  ellipse(500, 480, 125, 60); //mouth
  ellipse(500, 480, 125, 30); //lips

  line(375, 230, 450, 230); //left eyebrow
  strokeWeight(10); //make everything bold


  line(540, 230, 610, 230); //right eyebrow
}
