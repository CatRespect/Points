void collusion (int j) {
  for (int i=points.size()-1; i>=0; i--) {
    if (i!=j) {
      Point jj=points.get(j);
      Point ii=points.get(i);
      if (sqrt(sq(jj.get_x()-ii.get_x())+sq(jj.get_y()-ii.get_y()))<jj.size/2+ii.size/2) {
        float v=sqrt(sq(jj.get_move_x())+sq(jj.get_move_y()));
        float vx=v*ii.size/jj.size;
        float dx=jj.get_x()-ii.get_x();
        float dy=jj.get_y()-ii.get_y();
        float tg=dy/dx;
        float k=1;
        float vxx=vx/sqrt(sq(tg)+1);
        float vxy=vxx*tg;
        float fx=jj.get_move_x()+vxx;
        float fy=jj.get_move_y()+vxy;
        if (Float.isNaN(jj.get_move_x())) {
          jj.move(0, jj.get_move_y());
        }
        if (Float.isNaN(jj.get_move_y())) {
          jj.move(jj.get_move_x(),0);
        }
        jj.move(fx*k, fy*k);
        fx=ii.get_move_x()-vxx;
        fy=ii.get_move_y()-vxy;
        ii.move(fx*k, fy*k);
      }
    }
  }
}
