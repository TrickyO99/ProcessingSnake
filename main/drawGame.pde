//Array of objects (PVectors) that builds up our snake
ArrayList<PVector> snake;

//Global vars
int sizeSnake = 50; //Size of the rects of the snake (here, 50 by 50)
PVector direction; //Vector giving the direction of the snake in the map
int score = 0; //Highscore
int multiplicatorScore = 100; //Score difficulty setter

//Dat juicy apple position (multiple of 50)
int fruitx = round(int(random(9 * sizeSnake, 28 * sizeSnake)) / 50) * 50;
int fruity = round(int(random(6 * sizeSnake, 15 * sizeSnake)) / 50) * 50;

//Bool to know if the snake touched dat juicy apple
boolean didTouch = false;

//SFX
SoundFile mlg;

//GFX
PImage apple;
PImage luffyHead;
PImage luffyArm;
PImage luffyArmH;
PImage luffyArmV;
PImage luffyFist;
PImage luffyFistL;
PImage luffyFistR;
PImage luffyFistU;
PImage luffyFistD;

void setupGame()
{
  //Creating the snake
  snake = new ArrayList<PVector>();
  snake.add(new PVector(10, 10));
  direction = new PVector(1, 0);
  
  //SFX
  mlg = new SoundFile(this, "mlg.mp3");
  
  //GFX
  apple = loadImage("apple.png");
  luffyHead = loadImage("luffyHead.png");
  luffyArmH = loadImage("luffyArmH.png");
  luffyArmV = loadImage("luffyArmV.png");
  luffyArm = luffyArmH;
  luffyFistL = loadImage("luffyFistL.png");
  luffyFistR = loadImage("luffyFistR.png");
  luffyFistU = loadImage("luffyFistU.png");
  luffyFistD = loadImage("luffyFistD.png");
  luffyFist = luffyFistD;
}

void drawGame()
{

  //Condition to grow our snake
  if (didTouch == true) {
    bigSnake();
    mlg.play();
    didTouch = false;
  }
  
  //Function that draws our images every frame
  clear();
  
  //Drawing the score
  fill(255);
  textSize(64);
  text("Score = " + score, 1920/2, 100);
  
  //Drawing our game zone
  rect(1920/2 - 1000/2 - 10, 1080/2 - 500/2 + 10, 20 * sizeSnake, 10 * sizeSnake);
  
  //Drawing our fruit
  fill(255, 0, 0);
  image(apple, fruitx, fruity, sizeSnake, sizeSnake);
  
  //Getting that snake head
  PVector first = snake.get(0);
    
  //Checking if our snake head is still in the zone, otherwise it gets back in
  if (direction.x == 1 && first.x >= 29) {
    first.x = 9;
  } else if (direction.x == -1 && first.x <= 8) {
    first.x = 28;
  } else if (direction.y == 1 && first.y >= 16) {
    first.y = 6;
  } else if (direction.y == -1 && first.y <= 5) {
    first.y = 15;
  }
  
  //Condition to see if our snake ate that juicy apple and to replace another apple in the zone, to increase the score and to toggle "didTouch"
  if (first.x == fruitx / sizeSnake && first.y == fruity / sizeSnake) {
    fruitx = round(int(random(9 * sizeSnake, 28 * sizeSnake)) / 50) * 50;
    fruity = round(int(random(6 * sizeSnake, 15 * sizeSnake)) / 50) * 50;
    score += multiplicatorScore;
    direction.set(direction.x, direction.y);
    didTouch = true;
  }
  
  //Loop to draw our snake  
  int index = 0;
  for (PVector pos : snake) {
    //Draws our luffy : the fist for the first case and the head for the last one.
    if (index == snake.size() - 1) {
      image(luffyHead, pos.x * sizeSnake, pos.y * sizeSnake, sizeSnake, sizeSnake);
    } else if (index == 0) {
      if (direction.x == 1) {
        luffyFist = luffyFistR;
      } else if (direction.x == -1) {
        luffyFist = luffyFistL;
      } else if (direction.y == 1) {
        luffyFist = luffyFistD;
      } else if (direction.y == -1) {
        luffyFist = luffyFistU;
      }
      image(luffyFist, pos.x * sizeSnake, pos.y * sizeSnake, sizeSnake, sizeSnake);
    } else {
      if (luffyFist == luffyFistU || luffyFist == luffyFistD) {
        luffyArm = luffyArmV;
      } else {
        luffyArm = luffyArmH;
      }
      image(luffyArm, pos.x * sizeSnake,  pos.y * sizeSnake, sizeSnake, sizeSnake);
    }
    index = index + 1;
  }
  
  //Loop the give our snake body the conditions of the precedent snake body
  for (int i = snake.size() - 1; i > 0; i--) {
    snake.get(i).set(snake.get(i - 1));
    
    //Loose condition
    PVector pos = snake.get(i);
    PVector posFirst = snake.get(0);
    if (posFirst.x == pos.x && posFirst.y == pos.y && i > 2) {
      direction.set(0, 0);
      win = 2;
    } 
  }
  
  //Give direction to the snake
  snake.get(0).add(direction);
  
  //Win condition
  if (score == 1500) {
    win = 1;
  }
}

//Function to make our snake grow
void bigSnake()
{
  PVector dir;
  if (snake.size() > 2) {
    dir = PVector.sub(snake.get(snake.size() - 1), snake.get(snake.size() - 2));
  } else {
    dir = direction;
  }
  PVector pos = snake.get(snake.size() - 1);
  snake.add(PVector.sub(pos, dir));
}
