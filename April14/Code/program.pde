//Waad Abrahim
//April 14, Intro to Interactive Media
//Data Visualization/Generative text

/*Overall Concept & Instructions:
My program loops through a cycle of posters of movies and tv shows. When the user presses 
'enter' the cycle stops and the random poster that is selected corresponds to a
row in the netflix csv file and displays the information for that movie or tv show. 
The user can then press any button and it will return them to the main random selection 
screen for them to make another selection. */


//the list of texts is in the form of a csv file (table)
Table table;
//font variable
PFont font;
//random text variables
String type_c;
String title_c;
String posters_c;
String director_c;
String country_c;
String release_year_c;
String duration_c; 
String listed_in_c;
String description_c;


PImage[] movies = new PImage[9]; //array that holds all the images of the posters of the movies/tv  shows
PImage netflix; //background image of the netflix logo


void setup() {
  background(255); //set background to white
  size(700, 700); //set the size to 700 by 700
 
  netflix = loadImage("netflix.jpg"); //load the netflix logo image
  netflix.resize(700, 700); //resize it to fit the entire screen
  table = loadTable("netflix_titles.csv", "header"); //load csv file

  font = createFont("Monaco", 20); //load the font for the the text from the file to be presented in
  textFont(font, 20);

  for (int i = 0; i < movies.length; i++) //use a for loop to load all the poster images to the image array 
  {
    movies[i] = loadImage("movie" + (i) + ".jpg"); //names all start with movie and end with a number consecutive in order based on csv file
    movies[i].resize(300, 400); //resize the photos to be relatively the same
  }
}


int counter; // Automatically initialized at 0
int lastTime; // when the current image was first displayed
int DISPLAY_TIME = 100; // 100ms = 0.1 s

void draw() {
  background(255); //set the background to white
  tint(255, 0, 0); //red tint to following image
  image(netflix, 0, 0); //netflix background


  if (key== ENTER) { //if the enter key is pressed make and display the csv selection
    textAlign(LEFT); //left align
    fill(255); //text will be in white
    text("You've selected: \n"+title_c+"", 30, 200); //display this text at the specific location with the generated text from the file
    text("A " +country_c+" "+type_c+ "\nDirected by " +director_c+" and released in "+ release_year_c+ "\nThe " +type_c+" is " +duration_c+" long and listed as a \n" +listed_in_c+"", 30, 350);
    text("Description: " +description_c+"", 30, 480, 500, 500);
    fill(229, 9, 20); //text will be red now
    text("Press any key to make another selection", 30, 670); //instructions for going back to the original selection process
    DISPLAY_TIME = 1000000000; //pause on this poster for this amount of time (long enough to seem like its stopped)
    tint(255, 255);//removes previous tint from the background before displaying the poster
    movies[(int(posters_c))].resize(200, 300); //display poster that corresponds to the correct movie/tv show based on the csv file
    image(movies[(int(posters_c))], 400, 40);//move it to the upper right side
  } else { //looping through the images with 0.1 second delay, source: https://forum.processing.org/two/discussion/8085/i-display-images-in-sequence-but-i-see-only-the-last-one-why
    DISPLAY_TIME = 100; 
    if (millis() - lastTime >= DISPLAY_TIME) //when 0.1 second is reached the following if condition is executed
    {
      counter = ++counter % movies.length; //change the index, loop back around when the length of the image array is reached
      lastTime = millis(); //reset the last time
    }
    tint(255, 255); //remove tint from the previous background image
    image(movies[counter], 200, 150); //display the image in the array at the indicated index
    textAlign(CENTER); //align the text in the center
    fill(229, 9, 20); //text will be in red
    text("Press 'Enter' to make a selection", 350, 600); //instructions for selecting a movie/tv show to get more info
    selectFilm(); //selects a random film each time until enter is pressed and the other if condition is executed
  }
}



void selectFilm() { //loads all the information from the csv files into the corresponding arrays
  String type[] = table.getStringColumn("type");
  String posters[] = table.getStringColumn("posters");
  String title[] = table.getStringColumn("title");
  String director[] = table.getStringColumn("director");
  String country[] = table.getStringColumn("country");
  String release_year[] = table.getStringColumn("release_year");
  String duration[] = table.getStringColumn("duration");
  String listed_in[] = table.getStringColumn("listed_in");
  String description[] = table.getStringColumn("description");

  int select = (int(random(0, 9))); //generates a random number between 0 and 8

  //random number saved in the select variable is used as an index to retrieve the following information and save it to the corresponding variables
  type_c = type[select]; 
  title_c = title[select];
  posters_c = posters[select];
  director_c = director[select];
  country_c = country[select];
  release_year_c = release_year[select];
  duration_c = duration[select];
  listed_in_c = listed_in[select];
  description_c = description[select];
}
