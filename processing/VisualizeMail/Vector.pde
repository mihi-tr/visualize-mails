class Vector {
 int x,y;
 
 Vector (int nx, int ny) {
   x=nx;
   y=ny;
 }
 
 float len() {
     return sqrt(sq(x)+sq(y));
 }
 
 void set_len(float l) {
    x=int(x*l/len());
    y=int(y*l/len()); 
 }
 
 void add(Vector v) {
     x=x+v.x;
     y=y+v.y;
 }
 
 void scale(float f) {
   x=int(x*f);
   y=int(y*f);
 }
  
}
