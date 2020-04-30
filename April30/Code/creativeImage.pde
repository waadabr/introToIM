//Waad Abrahim
//April 30, Intro to Interactive Media
//Creative Image

/*Overall Concept & Instructions:
My program displays a creative image of a tinted UAE Flag over the NYUAD entrance sign (original photo) when 
the 'ENTER' key is pressed. This tint is removed when any other key is pressed. When the 
mouse is clicked the UAE flag in full color is shown on the screen overlapping the original
NYUAD entrance image. This full color flag is created by retrieving the pixels of the original 
image and changing their color.*/


PImage photo; //creates image variable

void setup() {
  size(1000, 700); //sets canvas size
  photo = loadImage("nyuad.jpg"); //load the image 
}

void draw() {
  noTint(); //removes any tint from the last draw loop

  photo.resize(1000, 700); //no need for a background color because the photo is sized for the full canvas
  image(photo, 0, 0); //print the original photo

  //save the following color codes for easier access with variable names
  color green = color(0, 115, 47);
  color white = color(255);
  color red = color(255, 0, 0);
  color black = color(0);


  if (key == ENTER) { //creates tinted UAE flag when the 'ENTER' key is pressed
    tint(60); //black tint
    PImage blackP = photo.get(0, 466, 1000, 233); //gets the black portion of the image matching the flag
    image(blackP, 0, 466); //prints that portion of the image with the black tint
    tint(green); //black tint is replaced with a green tint
    PImage greenP = photo.get(0, 0, 1000, 233); //gets the green portion of the image matching the flag
    image(greenP, 0, 0); //prints that portion of the image with the green tint
    tint(200); //green tint is replaced with a white tint
    PImage whiteP = photo.get(0, 233, 1000, 233); //gets the white portion of the image matching the flag
    image(whiteP, 0, 233);//prints that portion of the image with the white tint
    tint(red); //white tint is replaced with a red tint
    PImage redP = photo.get(0, 0, 300, 700); //gets the red portion of the image matching the flag
    image(redP, 0, 0);//prints that portion of the image with the red tint
  }


  loadPixels(); //loads the pixel data of the current display
  photo.loadPixels(); //gets the pixels in the photo
  if (mousePressed == true) { //covers the canvas with UAE flag when mouse is pressed
    noTint(); //removes any tint 
    for (int i = 466; i < (width + width*699); i++) { 
      pixels[i] = black; //covers the screen in black
    }
    for (int i = 233; i < (width + width*466); i++) {
      pixels[i] = white; //covers the designated pixels in white
    }
    for (int i = 0; i < (width + width*233); i++) {
      pixels[i] = green; //covers the designated pixels in green
    }
    for (int x = 0; x < (width - 700); x++) {
      // Loop through every pixel row
      for (int y = 0; y < height; y++) {
        // Use the formula to find the 1D location
        int loc = x + y * width;
        pixels[loc] = red; //covers the designated pixels in red (vertical bar)
      }
    }
    updatePixels(); //updates the display window when pixels are modified
  } 
}



