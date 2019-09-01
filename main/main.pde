//Globals
boolean menu = true; //Menu toggle
int win = 0; //Win or lose indicator
boolean levelSelector = false; //Level Selector toggle
int fps = 10; //Frames per second
int level = 0; //Level of difficulty

//SFX
import processing.sound.*;
SoundFile file;

//GFX
PImage wallpaper;

void setup()
{
  fullScreen(); //Windox size
  frameRate(fps); //Setting the framerate
  setupGame(); //Set values for the main game
  //SFX
  file = new SoundFile(this, "despacito.mp3");
  file.play();
  //GFX
  wallpaper = loadImage("wallpaper.png");
}

void draw()
{
  //displays the game, the menu, the level selector or the end of the game
  clear();
  if (menu == true) {
    drawMenu();
  } else if (levelSelector == true) {
    levelSelect();
  } else if (win != 0) {
    drawEnd();
  } else {
    drawGame(); 
  }
}

void keyPressed()
{
  keyGame();
}
