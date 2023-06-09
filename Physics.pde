void collusion (int j){
  for(int i=points.size()-1;i>j;i--){
    Point jj=points.get(j);
    Point ii=points.get(i);
    if(sqrt(sq(jj.get_x()-ii.get_x())+sq(jj.get_y()-ii.get_y()))<jj.size/2+ii.size/2){
      
      float res_x=jj.get_move_x()+ii.get_move_x();
      float res_y=jj.get_move_y()+ii.get_move_y();
      float t=sqrt(sq(jj.get_move_x())+sq(jj.get_move_y()))/sqrt(sq(ii.get_move_x())+sq(ii.get_move_y()));
      float mix=res_x/(1+t);
      float mjx=mix*t;
      float miy=res_y/(1+t);
      float mjy=miy*t;
      jj.move(mjx,mjy);
      ii.move(mix,miy);
    }
     
  }
    for(int i=j-1;i>=0;i--){
     Point jj=points.get(j);
    Point ii=points.get(i);
    if(sqrt(sq(jj.get_x()-ii.get_x())+sq(jj.get_y()-ii.get_y()))<jj.size/2+ii.size/2){
     
      float res_x=jj.get_move_x()+ii.get_move_x();
      float res_y=jj.get_move_y()+ii.get_move_y();
      float t=sqrt(sq(jj.get_move_x())+sq(jj.get_move_y()))/sqrt(sq(ii.get_move_x())+sq(ii.get_move_y()));
      float mix=res_x/(1+t);
      float mjx=mix*t;
      float miy=res_y/(1+t);
      float mjy=miy*t;
      jj.move(mjx,mjy);
      ii.move(mix,miy);
    }
    
  }
}