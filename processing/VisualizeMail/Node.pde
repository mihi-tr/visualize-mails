class Node {
    int size=10;
    int distance=int(3*size);
    int position_x,position_y;

    int alpha,ttl;
    String id;
    NodeList edgesto;
    
    Node (String nid) {
     id=nid; 
     position_x=int(random(width));
     position_y=int(random(height));
     alpha=255;
     ttl=ottl;
     edgesto=new NodeList();
    }
    
    Node (String nid, int x, int y) {
     id=nid; 
     position_x=x-100+int(random(200));
     position_y=y-100+int(random(200));
     alpha=255;
     ttl=ottl;
     edgesto=new NodeList();
    }
    
    
    void move() {
      ttl=ttl-step;
      alpha=int(map(ttl,0,ottl,0,255));
      Vector v=new Vector(0,0);
      /* if (distance_to(width/2,height/2)>size) {
        Vector v1=vector_to(width/2,height/2);
        v1.scale(weight()-2);
        v.add(v1);
        
      } */
      edgesto.clean();
      for (int i=0;i<edgesto.nl.size();i++) {
        Node n=(Node) edgesto.nl.get(i);
        if (distance_to(n) > distance*2) {
          Vector v1=vector_to(n);
          v1.scale(n.edgesto.nl.size());
          v.add(v1);
        }
      };
      v.set_len(2.5);
      move_by(v);
      if (position_x<=20) { 
        position_x=21;
      }
      else {if (position_x>=width-20) {position_x=width-21;}
      }
      if (position_y<=20) {
        position_y=21;
      }
      else {
        if (position_y>=height-20) { position_y=height-21; }
      }
    }
    
    int distance_to(int x, int y) {
      return int(sqrt(sq(x-position_x)+sq(y-position_y)));   
    }
    
    int distance_to(Node n) {
      return distance_to(n.position_x,n.position_y);
    }
    
    Vector vector_to (int x, int y) {
      return new Vector(x-position_x,y-position_y);
    };
    Vector vector_to(Node n) {
        return vector_to(n.position_x,n.position_y);
    }
    
    void collision(ArrayList nl) {
      for (int i=0;i<nl.size();i++){
         Node n=(Node) nl.get(i);
         if (distance_to(n)<distance) {
           Vector v=vector_to(n.position_x,n.position_y);
           v.set_len(distance-distance_to(n));
           if (weight()>=n.weight()) {
           n.move_by(v);}
           else {
             v.scale(-1);
             move_by(v);
           }
         };
      };
    };
    
    void move_by(Vector v) {
      position_x=position_x+v.x;
      position_y=position_y+v.y;
    }
    
    void edge_to(Node n) {
       if (! edgesto.has_node(n)) {
       edgesto.add(n);};
       
    }
    void draw() {
      stroke(alpha);
      strokeWeight(0);
      fill(255,255,0, alpha);
      ellipse (position_x,position_y,size,size);
    }
    
    int weight() {
        return edgesto.nl.size()+1;
    }
    
}
