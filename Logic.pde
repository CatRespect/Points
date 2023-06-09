void slick(Point point) {
  float res_x=0;
  float res_y=0;
  for (int i=0; i<touches.length; i++) {
    float del_x=touches[i].x-point.get_x();
    float del_y=touches[i].y-point.get_y();
    float dis=sqrt(sq(del_x)+sq(del_y));
    float t=sq(del_x/del_y);
    dis=sq(sq((dis-1300)*4/1300));
    dis=dis/(1+t);
    float move_y=dis;
    float move_x=move_y*t;
    move_x=sqrt(move_x);
    move_y=sqrt(move_x);//y
    if (del_x<0) {
      move_x=0-move_x;
    }
    if (del_y<0) {
      move_y=0-move_y;
    }
    res_x+=move_x;
    res_y+=move_y;
  }
  point.move(res_x, res_y);
}

void fasing(int i) {
  for (int j=points.size()-1; j>=0; j--) {
    if (i!=j) {
      Point ii=points.get(i);
      Point jj=points.get(j);
      if (ii.get_x()==jj.get_x() && ii.get_y()==jj.get_y()) {
        ii.place(ii.get_x()+random(-2, 2), ii.get_y()+random(-2, 2));
        jj.place(jj.get_x()+random(-2, 2), jj.get_y()+random(-2, 2));
      }
    }
  }
}
