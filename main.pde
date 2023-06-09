ArrayList<Point> points;


void setup(){
  size(displayWidth,displayHeight);
  frameRate(60);
  stroke(0);
  background (0);
  
  points=new ArrayList<Point>();
  points.add(new Point(width/2,height/2,#2A9627,20));
  for(int i=20;i>0;i--){
    for(int j=20;j>0;j--){
  points.add(new Point(width/2+(10-j)*25,height/2+(10-i)*50,color(random(255),random(255),random(255)),20));
}
  }
}

void draw(){
  background (0);
  //collusion();
  for(int i=points.size()-1;i>=0;i--){
    Point point = points.get(i);
    //collusion (i);
    point.update();
    fasing(i);
    point.draw();
    if(touches.length!=0){
    slick(point);
  }}
 
}