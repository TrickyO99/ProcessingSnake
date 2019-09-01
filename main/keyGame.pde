
void keyGame()
{
  if (keyCode == LEFT && direction.x != 1) {
    direction.set(-1, 0);
  } else if (keyCode == RIGHT && direction.x != -1) {
    direction.set(1, 0);
  } else if (keyCode == UP && direction.y != 1) {
    direction.set(0, -1);
  } else if (keyCode == DOWN && direction.y != -1) {
    direction.set(0, 1);
  } else if (key == 'p') {
    menu = true;
  }
}
