void display(){
  background(0);
  int x = 101;
  int y = 141;
  
  //----------------------------------------------
  //BACKGROUND TILES
  
  for(int i = 0; i < tiles.length; i++){
    fill(127);
    rect(x, y, 18, 18);
    x += 20;
    if((i+1) % 30 == 0){
      x = 101;
      y += 20;
    }
    
  }
  
  //----------------------------------------------
  //TILE TYPE
  x = 101;
  y = 141;
  
  for(int i = 0; i < tiles.length; i++){
    
    if(tiletype[i] == -1){
      fill(255, 0, 0);
      ellipse(x+9, y+9, 16, 16);
    } else if(tiletype[i] != 0){
      textAlign(CENTER, CENTER);
      fill(tiletype[i] * 30, 0, 127);
      textSize(16);
      text(tiletype[i], x + 9, y + 8);
    }
       
    x += 20;
    if((i+1) % 30 == 0){
      x = 101;
      y += 20;
    }
  }
  
  //------------------------------------------------
  //COVER LAYER
  x = 101;
  y = 141;
  
  for(int i = 0; i < tiles.length; i++){
    fill(192);
    if(iscovered[i] && !isdead){
      rect(x, y, 18, 18);
    }
    x += 20;
    if((i+1) % 30 == 0){
      x = 101;
      y += 20;
    }
    
  }
  
  //------------------------------------------------
  //FLAG LAYER
  x = 101;
  y = 141;
  
  for(int i = 0; i < tiles.length; i++){
    fill(0, 255, 255);
    if(isflagged[i] && !isdead){
      ellipse(x+9, y+9, 16, 16);
    }
    x += 20;
    if((i+1) % 30 == 0){
      x = 101;
      y += 20;
    }
    
  }
  
  //-----------------------------------------------------
  //TEXT
  
  fill(255);
  textAlign(LEFT, CENTER);
  textSize(16);
  text("Flags: " + flagged, 20, 20);
  text("Mines: 99", 20, 40);
  text("Tiles to uncover: " + (stillcovered - 99), 20, 60);
  
}
