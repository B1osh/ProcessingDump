void zeroclicked() {
  for(int i = 0; i < tiles.length; i++){
    
    
    //Checks 4 corners first
  if(tiletype[i] == 0 && !iscovered[i]){
    if(i == 0){
      
      iscovered[1] = false;
      iscovered[30] = false;
      iscovered[31] = false;
      
    }else if(i == 29){
      
      iscovered[28] = false;
      iscovered[58] = false;
      iscovered[59] = false;
      
    }else if(i == 450){
      
      iscovered[420] = false;
      iscovered[421] = false;
      iscovered[451] = false;
      
    }else if(i == 479){
      
      iscovered[448] = false;
      iscovered[478] = false;
      iscovered[449] = false;
      
    }else if(i < 30){          //Now checking edges
      
      iscovered[i - 1] = false;
      iscovered[i + 1] = false;
      iscovered[i + 29] = false;
      iscovered[i + 30] = false;
      iscovered[i + 31] = false;
      
    }else if(i >= 450){
      
      iscovered[i - 1] = false;
      iscovered[i + 1] = false;
      iscovered[i - 29] = false;
      iscovered[i - 30] = false;
      iscovered[i - 31] = false;
      
    }else if(i % 30 == 0){
      
      iscovered[i + 30] = false;
      iscovered[i + 1] = false;
      iscovered[i - 29] = false;
      iscovered[i - 30] = false;
      iscovered[i + 31] = false;
      
    }else if(i % 30 == 29){
      
      iscovered[i - 1] = false;
      iscovered[i + 30] = false;
      iscovered[i - 31] = false;
      iscovered[i - 30] = false;
      iscovered[i + 29] = false;
      
    }else{                  //Now check everything else
      
      iscovered[i - 31] = false;
      iscovered[i - 30] = false;
      iscovered[i - 29] = false;
      iscovered[i - 1] = false;
      iscovered[i + 1] = false;
      iscovered[i + 29] = false;
      iscovered[i + 30] = false;
      iscovered[i + 31] = false;
      
    } 
  } 
  }
}
