
void tiles(){
  for(int i = 0; i < tiles.length; i++){
    int j = 0;

//Finds number of bombs surrounding each bomb

//Checks 4 corners first
  if(tiletype[i] != -1){
    if(i == 0){
      
      if(tiletype[1] == -1){
        j ++;
      }
      if(tiletype[30] == -1){
        j ++;
      }
      if(tiletype[31] == -1){
        j ++;
      }
      
    }else if(i == 29){
      
      if(tiletype[28] == -1){
        j ++;
      }
      if(tiletype[59] == -1){
        j ++;
      }
      if(tiletype[58] == -1){
        j ++;
      }
      
    }else if(i == 450){
      
        if(tiletype[420] == -1){
        j ++;
      }
      if(tiletype[421] == -1){
        j ++;
      }
      if(tiletype[451] == -1){
        j ++;
      }
      
    }else if(i == 479){
      
        if(tiletype[478] == -1){
        j ++;
      }
      if(tiletype[448] == -1){
        j ++;
      }
      if(tiletype[449] == -1){
        j ++;
      }
      
    }else if(i < 30){          //Now checking edges
    
      if(tiletype[i - 1] == -1){
        j ++;
      }
      if(tiletype[i + 1] == -1){
        j ++;
      }
      if(tiletype[i + 29] == -1){
        j ++;
      }
      if(tiletype[i + 30] == -1){
        j ++;
      }
      if(tiletype[i + 31] == -1){
        j ++;
      }
      
    }else if(i >= 450){
      
      if(tiletype[i - 1] == -1){
        j ++;
      }
      if(tiletype[i + 1] == -1){
        j ++;
      }
      if(tiletype[i - 29] == -1){
        j ++;
      }
      if(tiletype[i - 30] == -1){
        j ++;
      }
      if(tiletype[i - 31] == -1){
        j ++;
      }
      
    }else if(i % 30 == 0){
      
      if(tiletype[i + 30] == -1){
        j ++;
      }
      if(tiletype[i + 1] == -1){
        j ++;
      }
      if(tiletype[i - 29] == -1){
        j ++;
      }
      if(tiletype[i - 30] == -1){
        j ++;
      }
      if(tiletype[i + 31] == -1){
        j ++;
      }
      
    }else if(i % 30 == 29){
      
      if(tiletype[i + 30] == -1){
        j ++;
      }
      if(tiletype[i - 1] == -1){
        j ++;
      }
      if(tiletype[i - 31] == -1){
        j ++;
      }
      if(tiletype[i - 30] == -1){
        j ++;
      }
      if(tiletype[i + 29] == -1){
        j ++;
      }
      
    }else{                  //Now check everything else
      
      if(tiletype[i - 31] == -1){
        j ++;
      }
      if(tiletype[i - 30] == -1){
        j ++;
      }
      if(tiletype[i - 29] == -1){
        j ++;
      }
      if(tiletype[i - 1] == -1){
        j ++;
      }
      if(tiletype[i + 1] == -1){
        j ++;
      }
      if(tiletype[i + 29] == -1){
        j ++;
      }
      if(tiletype[i + 30] == -1){
        j ++;
      }
      if(tiletype[i + 31] == -1){
        j ++;
      }
      
    }
    tiletype[i] = j;
      
    }
    
  }
}
