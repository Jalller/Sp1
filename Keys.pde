class Keys
{
  char keys;
  private boolean wDown = false;
  private boolean aDown = false;
  private boolean sDown = false;
  private boolean dDown = false;
  private boolean UPDown = false;
  private boolean LEFTDown = false;
  private boolean DOWNDown = false;
  private boolean RIGHTDown = false;
  private boolean nDown = false; //does nothing... yet :) 
  
  public Keys(){}
  
  public boolean wDown()
  {
    return wDown;
  }
  
  public boolean aDown()
  {
    return aDown;
  }
  
  public boolean sDown()
  {
    return sDown;
  }
  
  public boolean dDown()
  {
    return dDown;
  }
    public boolean UPDown()
  {
    return UPDown;
  }
  
  public boolean LEFTDown()
  {
    return LEFTDown;
  }
  
  public boolean DOWNDown()
  {
    return DOWNDown;
  }
  
  public boolean RIGHTDown()
  {
    return RIGHTDown;
  }
  
   public boolean nDown()
  {
    return nDown;
  }
  
  
  
  void onKeyPressed(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = true;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = true;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = true;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = true;
    }
    else if(keyCode == UP)
    {
      UPDown = true;
    }
    else if (keyCode == LEFT)
    {
      LEFTDown = true;
    }
    else if(keyCode == DOWN)
    {
      DOWNDown = true;
    }
    else if(keyCode == RIGHT)
    {
      RIGHTDown = true;
    }
     else if(ch == 'N' || ch == 'n')
    {
      nDown = true;

    }
  }
  
  void onKeyReleased(char ch)
  {
    if(ch == 'W' || ch == 'w')
    {
      wDown = false;
    }
    else if (ch == 'A' || ch == 'a')
    {
      aDown = false;
    }
    else if(ch == 'S' || ch == 's')
    {
      sDown = false;
    }
    else if(ch == 'D' || ch == 'd')
    {
      dDown = false;

    }
    
    else if(ch == 'N' || ch == 'n')
    {
      nDown = false;

    }
    
    else if(keyCode == UP)
    {
      UPDown = false;
    }
    else if (keyCode == LEFT)
    {
      LEFTDown = false;
    }
    else if(keyCode == DOWN)
    {
      DOWNDown = false;
    }
    else if(keyCode == RIGHT)
    {
      RIGHTDown = false;
    }
  }
  
  
}
