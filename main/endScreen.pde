void drawEnd()
{
  clear();
  file.stop(); //Stop the music
  //Display win or lose game screen
  if (win == 1) {
    drawWinEnd();
  }
  else if (win == 2) {
    drawLooseEnd();
  }
}

void drawWinEnd()
{
  score = 0;
  setupGame();
  fps = 10;
  background(0, 180, 0);
  fill(0, 0, 0);
  textSize(96);
  textAlign(CENTER);
  text("You Won !", width / 2, height / 2 - 150);
  textSize(64);
  text("Restart", width / 2, height / 2);
  text("Exit", width / 2, height / 2 + 150);
}

void drawLooseEnd()
{
  score = 0;
  setupGame();
  fps = 10;
  background(180, 0, 0);
  fill(0, 0, 0);
  textSize(96);
  textAlign(CENTER);
  text("Game Over", width / 2, height / 2 - 150);
  textSize(64);
  text("Restart", width / 2, height / 2);
  text("Exit", width / 2, height / 2 + 150);
}
