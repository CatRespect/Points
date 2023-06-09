void collusion (int j) {
  for (int i=points.size()-1; i>=0; i--) {
    if (i!=j) {
      Point jj=points.get(j);
      Point ii=points.get(i);
      if (sqrt(sq(jj.get_x()-ii.get_x())+sq(jj.get_y()-ii.get_y()))<jj.size/2+ii.size/2) {
        float v=sqrt(sq(jj.get_move_x())+sq(jj.get_move_y()));
        float vx=v*ii.size/jj.size;
        float dy=jj.get_y()-ii.get_y();
        float dx=jj.get_x()-ii.get_x();
        float tg=abs(dy/dx);
        float vxx=vx/sqrt(sq(tg)+1);
        float vxy=vxx*tg;
        float fx=jj.get_move_x()+vxx;
        float fy=jj.get_move_y()+vxy;
        jj.move(fx, fy);
        
        //float uy=jj.get_move_y()-fy;
        //float ux=jj.get_move_x()-fx;
        //ii.move(ux, uy);
        
      }
    }
  }
}
