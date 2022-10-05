void mouseClicked(){
  float tileclicked = -1;
  if(mouseX > 100 && mouseX < 700 && mouseY > 140 && mouseY < 460){
    tileclicked = ((mouseX - 100) - (mouseX % 20)) / 20;
    tileclicked += 30 * ((mouseY - 140) - (mouseY % 20)) / 20;
  }
  
  if(mouseButton == RIGHT && tileclicked >= 0 && tileclicked < 480){
    isflagged[int(tileclicked)] = !isflagged[int(tileclicked)];
    println("hey");
  }
  if(mouseButton == LEFT && tileclicked >= 0 && tileclicked < 480 && !isflagged[int(tileclicked)]){
    if(tiletype[int(tileclicked)] == -1){
      isdead = true;
    }
    iscovered[int(tileclicked)] = false;
    println("test");
  }
  if(mouseButton == LEFT){
    println("hi");
  }
  println(tileclicked);
  println(iscovered);
}
