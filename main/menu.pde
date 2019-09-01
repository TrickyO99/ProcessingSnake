boolean overPlayBox = false;

boolean drawMenu()
{
  clear();
  background(wallpaper);
  if (overPlayBox == true) {
    overPlayBox = false;
    menu = false;
    return (false);
  }
  drawTextMenu();
  return (true);
}

void drawTextMenu()
{
  textAlign(CENTER);
  //textFont(font);
  fill(255, 255, 255);
  text("Gear Fourth : Snakeman !", width / 2, 200);
  textSize(64);
  text("Play", width / 2, 450);
  text("Level Selector", width / 2, 600);
  text("Exit", width / 2, 750);
}

boolean isOverRect(int x, int y, int width, int height)
{
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
    return (true);
  } else {
    return (false);
  }
}

void mousePressed()
{
  int nb = 1;
  int x = 75;
  
  if (menu == true) {
    levelSelector = false;
    if (isOverRect(width / 2 - 50, 390, 100, 75) == true) {
      overPlayBox = true;
      menu = false;
    }
    if (isOverRect(width / 2 - 140, 550, 275, 60) == true) {
      menu = false;
      levelSelector = true;
    }
    if (isOverRect(width / 2 - 470, 690, 935, 80) == true) {
      exit();
    }
  } else if (win != 0) {
    if (isOverRect(width / 2 - 65, height / 2 - 50, 145, 80) == true) {
      menu = false;
      win = 0;
    }
    if (isOverRect(width / 2 - 50, height / 2 + 90, 110, 85) == true) {
      exit();
    }
  } else if (levelSelector == true) {
    if (isOverRect(85, 900, 230, 115) == true) {
      menu = true;
      levelSelector = false;
    }
    while (nb <= 5) {
      if (isOverRect(x, 300, 100, 200) == true) {
        level = nb;
        multiplicatorScore = multiplicatorScore / nb;
        fps = 10 * nb;
      }
      nb = nb + 1;
      x = x + 200;
    }
  }
}
