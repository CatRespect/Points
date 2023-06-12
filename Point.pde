class Point {
  float x, y, move_x, move_y;
  color col;
  int size;
  Point (float xx, float yy, color c, int s) {
    x=xx;
    y=yy;
    move_x=0;
    move_y=0;
    col= c;
    size=s;
  }
  void print() {
    printArray(str(x)+" "+str(y)+" "+str(move_x)+" "+str(move_y));
  }
  void draw() {
    stroke(col);
    fill(col);
    ellipse(x, y, size, size);
  }void inverted_draw() {
    stroke(255-red(col),255-green(col),255-blue(col));
    fill(255-red(col),255-green(col),255-blue(col));
    ellipse(x, y, size, size);
  }
  void pdraw() {
    if (frameCount/60%2==1) {
      stroke(col, frameCount%60+40+1);
      fill(col, frameCount%60+40+1);
    } else {
      stroke(col, 60-frameCount%60-1+40);
      fill(col, 60-frameCount%60-1+40);
    }
    ellipse(x, y, size, size);
  }
  void update() {
    x+=move_x;
    y+=move_y;
    if (x>width-barrier) {
      x=width-barrier;
    }
    if (y>height-barrier) {
      y=height-barrier;
    }
    if (x<barrier) {
      x=barrier;
    }
    if (y<barrier) {
      y=barrier;
    }
  }
  void pupdate() {
    if (y>barrier*4.5 && x<=width/2-10-size/2 && SelectedMode!=1) {
      SelectedMode=1;
      saving();
    } else if (y>barrier*4.5 && x>=width/2+10+size/2 && SelectedMode!=2) {
      SelectedMode=2;
      saving();
    }

    if (y>barrier*3.5-size/2 && x<=width/2-10-size/2) {
      x+=move_x;
      if (x>width/2-10-size/2) {
        x=width/2-10-size/2;
      }
    } else if (y>barrier*3.5-size/2 && x>=width/2+10+size/2) {
      x+=move_x;
      if (x<width/2+10+size/2) {
        x=width/2+10+size/2;
      }
    } else {
      x+=move_x;
    }
    y+=move_y;
    if (x>width/2-10-size/2 && x<width/2+10+size/2 && y>barrier*3.5-size/2) {
      y=barrier*3.5-size/2;
    }
    if (x>width-barrier*1.5-10-size/2) {
      x=width-barrier*1.5-10-size/2;
    }
    if (y>barrier*5-10-size/2) {
      y=barrier*5-10-size/2;
    }
    if (x<barrier*1.5+10+size/2) {
      x=barrier*1.5+10+size/2;
    }
    if (y<barrier+10+size/2) {
      y=barrier+10+size/2;
    }
  }
  void move(float xx, float yy) {
    move_x=xx;
    move_y=yy;
  }
  void place(float xx, float yy) {
    x=xx;
    y=yy;
  }
  float get_x() {
    return x;
  }
  float get_y() {
    return y;
  }
  float get_move_x() {
    return move_x;
  }
  float get_move_y() {
    return move_y;
  }
}
