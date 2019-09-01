void levelSelect()
{
  clear();
  background(0, 0, 200);
  drawTextLevel();
}

void drawTextLevel()
{
  int nb = 1;
  int x = 100;
  textAlign(CENTER);
  fill(#FFD700);
  textSize(96);
  text("Level Selector", width / 2, 150);
  textSize(64);
  text("Choose your level !", width / 2, 275);
  textSize(128);
  text("Back", 200, 1000);
  
  while (nb <= 5) {
    if (nb == level) {
      fill(#FFFFFF);
    } else {
      fill(#FF0000);
    }
    text(nb, x, 425);
    nb = nb + 1;
    x = x + 200;
  }
}
