/**
 * Array 2D. 
 * 
 * Demonstrates the syntax for creating a two-dimensional (2D) array.
 * Values in a 2D array are accessed through two index values.  
 * 2D arrays are useful for storing images. In this example, each dot 
 * is colored in relation to its distance from the center of the image. 
 */
 
import java.util.Random;
int time;
Game game = new Game(30, 20, 2,2,1,1); //2 enemies for each player (4 total) //all four kan take life from both players //Same goes for points (total 2)
PFont font;

public void settings() {
  size(1201, 801);
}

void setup()
{
  frameRate(10);
  font = createFont("Arial", 16, true);
  textFont(font, 16);
  time = millis (); //Won't work... 
}

void keyReleased()
{
  game.onKeyReleased(key);
}

void keyPressed()
{
  game.onKeyPressed(key);
}

void draw()
{
  game.update();
  background(0); //Black
  // This embedded loop skips over values in the arrays based on
  // the spacer variable, so there are more values in the array
  // than are drawn here. Change the value of the spacer variable
  // to change the density of the points
  int[][] board = game.getBoard();
  for (int y = 0; y < game.getHeight(); y++)
  {
    for (int x = 0; x < game.getWidth(); x++)
    {
      if(board[x][y] == 0)
      {
        fill(0,0,0);
      }
      else if(board[x][y] == 1) //Player 1
      {
        fill(0,0,255); //Blue 
      }
      else if(board[x][y] == 2) //Enemies
      {
        fill(255,0,0); //Red
      }
      else if(board[x][y] == 3) //Points
      {
        fill(0,255,0); // Green
      }
       else if(board[x][y] == 4) //Player 2
      {
        fill(255,255,0); //Yellow
      }
      stroke(100,100,100);
      rect(x*40, y*40, 40, 40);
      ;
 
  }
} 
    
  
  fill(255);

  
  text("Lifes: "+game.getPlayerLife(), 20,25); //Lifes player 1, set number in game tab (Starts at 20)
  text("Lifes: "+game.getPlayer2Life(), 1100,25); //Lifes player 2, set number in game tab 
  text("Points: "+game.getPlayerPoints(), 20,50); //points player 1, set number in game tab (Starts at 0, wins at 10)
  text("Points: "+game.getPlayer2Points(), 1100,50); //points player 2, set number in game tab 
  
}
