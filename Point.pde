class Point{
  float x, y,move_x,move_y;
  color col;
  int size;
  Point (int xx, int yy,color c,int s){
    x=float(xx);
    y=float(yy);
    move_x=0;
    move_y=0;
    col= c;
    size=s;
  }
  void print(){
    printArray(str(x)+" "+str(y)+" "+str(move_x)+" "+str(move_y));
  }
  void draw(){
    stroke(col);
    fill(col);
    ellipse(x,y,size,size);
    }
  void update(){
    x+=move_x;
    y+=move_y;
    if(x>width*0.87){
      x=width*0.87;
    }
    if(y>height*0.87){
      y=height*0.87;
    }
    if(x<width*0.13){
      x=width*0.13;
    }
    if(y<height*0.13){
      y=height*0.13;
    }
  }
  void move(float xx,float yy){
    move_x=xx;
    move_y=yy;
  }
  void place(float xx,float yy){
    x=xx;
    y=yy;
  }
  float get_x(){
    return x;
  }
  float get_y(){
    return y;
  }
  float get_move_x(){
    return move_x;
  }
  float get_move_y(){
    return move_y;
  }
}