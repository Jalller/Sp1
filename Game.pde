import java.util.Random;

class Game
{
  private Random rnd;
  private final int width;
  private final int height;
  private int[][] board;
  private Keys keys;
  private int playerLife;
  private int player2Life;
  private int playerPoints;
  private int player2Points; 
  private Dot player;
  private Dot player2;
  private Dot[] enemies;
  private Dot[] enemies2;
  private Dot[] points;
  private Dot[] points2;
  private int time; //(*)
  float speed = 0.9; //(*)
  
   
  Game(int width, int height, int numberOfEnemies,int numberOfEnemies2,int numberOfPoints,int numberOfPoints2)
  {
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfEnemies < 0)
    {
      throw new IllegalArgumentException("Number of Enemies must be positive");
    } 
    
    if(width < 10 || height < 10)
    {
      throw new IllegalArgumentException("Width and height must be at least 10");
    }
    if(numberOfPoints < 0)
    {
      throw new IllegalArgumentException("Number of points must be positive");
    } 
    this.rnd = new Random();
    this.board = new int[width][height];
    this.width = width;
    this.height = height;
    keys = new Keys();
    player = new Dot(0,0,width-1, height-1); //Player 1
    player2 = new Dot(29,0,width-1, height-1); //Player 2
    enemies = new Dot[numberOfEnemies];
    for(int i = 0; i < numberOfEnemies; ++i)
    {
      enemies[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    enemies2 = new Dot[numberOfEnemies2];
    for(int i = 0; i < numberOfEnemies2; ++i)
    {
      enemies2[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    this.playerLife = 20;
    this.player2Life = 20;
    //}
    
     points = new Dot[numberOfPoints];
    for(int i = 0; i < numberOfPoints; ++i)
    {
      points[i] = new Dot(width-1, height-1, width-1, height-1);
    }
     points2 = new Dot[numberOfPoints2];
    for(int i = 0; i < numberOfPoints2; ++i)
    {
      points2[i] = new Dot(width-1, height-1, width-1, height-1);
    }
    
    this.playerPoints = 0;
    this.player2Points = 0;
    }

  
  public int getWidth()
  {
    return width;
  }
  
  public int getHeight()
  {
    return height;
  }
  
  public int getPlayerLife() //Need to optimize code  (reset function... (?)) 
  {
    textSize(80); //Delay text on screen won't work (*time, millis*) (?) //Look at notes
    if(this.playerLife<=0 && millis() < time + 10000) text("GAMEOVER: PLAYER 2 WINS",50,400); 
    if(this.playerLife <= 0) player = new Dot(0,0,width-1, height-1); //Player 1 moves back in position
    if(this.playerLife <= 0) player2 = new Dot(29,0,width-1, height-1); //Player 2 moves back in position
    if(this.playerLife <= 0) playerLife = 20; //Starts over, full life
    if(this.playerLife <= 0) player2Life = 20; //Starts over, full life 
    textSize(20);
    return playerLife;
  }
  
   public int getPlayer2Life()  ///**********************
  {
    textSize(80); 
    if (this.player2Life<=0 && millis() < time + 150000) text("GAMEOVER: PLAYER 1 WINS",50,400); 
    if (this.player2Life <=0) player2 = new Dot(29,0,width-1, height-1);
    if(this.player2Life <= 0) player = new Dot(0,0,width-1, height-1);
    if(this.player2Life <= 0) playerLife = 20;
    if(this.player2Life <= 0) player2Life = 20;
    textSize(20);
    return player2Life;
  }
  
  public int getPlayerPoints()   ///*********************
  {
    textSize(100);
    if(this.playerPoints >=10 && millis() < time + 10000) text("Player 1 wins",300,400);
    if(this.playerPoints >=10) player = new Dot(0,0,width-1, height-1);
    if(this.playerPoints >=10) player2 = new Dot(29,0,width-1, height-1);
    if(this.playerPoints >=10) playerPoints = 0;
    if(this.playerPoints >=10) player2Points = 0;
    textSize(20);
    return playerPoints;
  }
  

  
   public int getPlayer2Points() ///*********************
  {
    textSize(100); //Delay text on screen won't work (*time, millis*) (?)
    if (this.player2Points>=10 && millis() < time + 10000) text("Player 2 wins",300,400);
    if (this.player2Points >=10) player2 = new Dot(29,0,width-1, height-1);
    if(this.player2Points >=10) player = new Dot(0,0,width-1, height-1);
    if(this.player2Points >=10) player2Points = 0;
    if(this.player2Points >=10) playerPoints = 0;  
    //if (this.player2Points <=0) resetBoard();
    textSize(20);
    return player2Points;
  }
  
  public void onKeyPressed(char ch)
  {
    keys.onKeyPressed(ch);
  }
  
  public void onKeyReleased(char ch)
  {
    keys.onKeyReleased(ch);
  }
  
  public void update()
  {
    updatePlayer();
    updatePlayer2();
    updateEnemies();
    updateEnemies2();
    updatePoints();
    updatePoints2();
    checkForCollisions();
    clearBoard();
    populateBoard();

  }
  
  
  
  public int[][] getBoard()
  {
    
    return board;
  }
  
  private void clearBoard()
  {
    for(int y = 0; y < height; ++y)
    {
      for(int x = 0; x < width; ++x)
      {
        board[x][y]=0;
      }
    }
  }
  
  private void updatePlayer()
  {
    //Update player
    if(keys.wDown() && !keys.sDown())
    {
      player.moveUp();
    }
    if(keys.aDown() && !keys.dDown())
    {
      player.moveLeft();
    }
    if(keys.sDown() && !keys.wDown())
    {
      player.moveDown();
    }
    if(keys.dDown() && !keys.aDown())
    {
      player.moveRight();
    }  
  }
  
  private void updatePlayer2()
  {
    //Update player
    if(keys.UPDown() && !keys.DOWNDown())
    {
      player2.moveUp();
    }
    if(keys.LEFTDown() && !keys.RIGHTDown())
    {
      player2.moveLeft();
    }
    if(keys.DOWNDown() && !keys.UPDown())
    {
      player2.moveDown();
    }
    if(keys.RIGHTDown() && !keys.LEFTDown())
    {
      player2.moveRight();
    }  
  }
  
  private void updateEnemies() //Enemies player 1
  {
    for(int i = 0; i < enemies.length; ++i)
    {
      if(rnd.nextInt(4) < 2)
      {
        //We follow
        float dx = player.getX() - enemies[i].getX()*speed;
        float dy = player.getY() - enemies[i].getY()*speed;
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            //Player is to the right
            enemies[i].moveRight();
          }
          else
          {
            //Player is to the left
            enemies[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          //Player is down;
          enemies[i].moveDown();
        }
        else
        {//Player is up;
          enemies[i].moveUp();
        }
      }
      else
      {
        //We move randomly
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          //Move right
          enemies[i].moveRight();
        }
        else if(move == 1)
        {
          //Move left
          enemies[i].moveLeft();
        }
        else if(move == 2)
        {
          //Move up
          enemies[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          enemies[i].moveDown();
        }
      }
    }
  }
  
    private void updateEnemies2() //Enemies player 2
  {
    for(int i = 0; i < enemies2.length; ++i)
    {
      if(rnd.nextInt(4) < 2)
      {
        float dx = player2.getX() - enemies2[i].getX()*speed;
        float dy = player2.getY() - enemies2[i].getY()*speed;
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            enemies2[i].moveRight();
          }
          else
          {
            enemies2[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          enemies2[i].moveDown();
        }
        else
        {
          enemies2[i].moveUp();
        }
      }
      else
      {
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          enemies2[i].moveRight();
        }
        else if(move == 1)
        {
          enemies2[i].moveLeft();
        }
        else if(move == 2)
        {
          enemies2[i].moveUp();
        }
        else if(move == 3)
        {
          enemies2[i].moveDown();
        }
      }
    }
  }
  
  private void updatePoints() //Points player 1
  {
   
    for(int i = 0; i < points.length; ++i)
    {
      if(rnd.nextInt(3) < 2)
      {
        float dx = (points[i].getX() - player.getX()*speed); // (*)
        float dy = (points[i].getY() - player.getY()*speed);
        
        if(abs(dx) > abs(dy))
        {
          if(dx > 0)
          {
            points[i].moveRight();
          }
          else
          {
            points[i].moveLeft();
          }
        }
        else if(dy > 0)
        {
          points[i].moveDown();
        }
        else
        {
          points[i].moveUp();
        }
      }
      else
      {
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          points[i].moveRight();
        }
        else if(move == 1)
        {
          points[i].moveLeft();
        }
        else if(move == 2)
        {
          points[i].moveUp();
        }
        else if(move == 3)
        {
          points[i].moveDown();
        }
      }
    }
  }
  
  private void updatePoints2() //Points player 2
  {
    for(int i = 0; i < points2.length; ++i)
    {
      if(rnd.nextInt(3) < 2)
      {
        float dx = (points2[i].getX() - player2.getX()*speed);
        float dy = (points2[i].getY() - player2.getY()*speed);
        
        if(abs(dx) < abs(dy))
        {
          if(dx < 0)
          {
            points2[i].moveRight();
          }
          else
          {
            points2[i].moveLeft();
          }
        }
        else if(dy < 0)
        {
          points2[i].moveDown();
        }
        else
        {
          points2[i].moveUp();
        }
      }
      else
      {
        int move = rnd.nextInt(4);
        if(move == 0)
        {
          points2[i].moveRight();
        }
        else if(move == 1)
        {
          points2[i].moveLeft();
        }
        else if(move == 2)
        {
          points2[i].moveUp();
        }
        else if(move == 3)
        {
          //Move down
          points2[i].moveDown();
        }
      }
    }
  }
  
  private void populateBoard()
  {
    //Insert players
    board[player.getX()][player.getY()] = 1; //Player 1
    board[player2.getX()][player2.getY()] = 4; //Player 2
    //Insert enemies
    for(int i = 0; i < enemies.length; ++i)
    {
      board[enemies[i].getX()][enemies[i].getY()] = 2; //Enemies // Enemies that follows player 1 //combine(*)
      board[enemies2[i].getX()][enemies2[i].getY()] = 2; //Enemies // Enemies that follows player 2 //combine(*)
    }
    //Insert points
    for(int i = 0; i < points.length; ++i)
    {
      board[points[i].getX()][points[i].getY()] = 3; //Points //point that moves away from player 1 //combine (*)
      board[points2[i].getX()][points2[i].getY()] = 3; //Points //point that moves away from player 2 //combine (*)
    }
  }
  

   
  private void checkForCollisions()
  {
    //Check enemy collisions
    for(int i = 0; i < enemies.length; ++i)
    {
      if(enemies[i].getX() == player.getX() && enemies[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife; //Takes one life from player 1
      }
      if(enemies[i].getX() == player2.getX() && enemies[i].getY() == player2.getY())
      {
        //We have a collision
        --player2Life; //Takes one life from player 2
        
      }
    }
    
      for(int i = 0; i < enemies2.length; ++i)
    {
      if(enemies2[i].getX() == player.getX() && enemies2[i].getY() == player.getY())
      {
        //We have a collision
        --playerLife; //Takes one life from player 1
      }
      if(enemies2[i].getX() == player2.getX() && enemies2[i].getY() == player2.getY())
      {
        //We have a collision
        --player2Life; //Takes one life from player 2
        
      }
    }
    
    //Check points collisions
    for(int i = 0; i < points.length; ++i)
    {
      if(points[i].getX() == player.getX() && points[i].getY() == player.getY())
      {
        //We have a collision
        ++playerPoints; //Adds one point to player 1
      } 
      if(points[i].getX() == player2.getX() && points2[i].getY() == player2.getY())
      {
        //We have a collision
        ++player2Points; //Adds one point to player 2
        
      }
  }
      for(int i = 0; i < points2.length; ++i)
    {
      if(points2[i].getX() == player.getX() && points2[i].getY() == player.getY())
      {
        //We have a collision
        ++playerPoints; //Adds one point to player 1
      } 
      if(points2[i].getX() == player2.getX() && points2[i].getY() == player2.getY())
      {
        //We have a collision
        ++player2Points; //Adds one point to player 2
        
      }
  }
  }
  
 
}
