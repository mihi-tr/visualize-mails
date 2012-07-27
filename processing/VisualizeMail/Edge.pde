

class Edge {
   Node a,b;
   int alpha,ttl;
   ArrayList ttls;
   
   Edge (Node na,Node nb) {
       a=na;
       b=nb;
       a.edge_to(b);
       b.edge_to(a);
       alpha=255;
       ttls=new ArrayList();
       ttls.add(ottl);
   }
   
   void draw() {
     int tnt=get_tint();
     stroke(tnt,tnt,255,alpha);
     strokeWeight(1);
     line(a.position_x,a.position_y,b.position_x,b.position_y);
   }
   
   int get_alpha() {
       Integer t=0;
       for (int i=0; i<ttls.size(); i++) {
           Integer t1=(Integer) ttls.get(i);
           if (t1>t) {
               t=t1;
           }
       }
       return int(map(t,0,ottl,0,255));
   }
   
   int get_tint() {
       return int(map(ttls.size(),0,60,0,255));
   }
   void move() {
      for (int i=0;i<ttls.size(); i++) {
        Integer t=(Integer) ttls.get(i);
        t=t-step;
        if (t<=0) {
            ttls.remove(i);
        }
        else {
          ttls.set(i,t);
        }
      }
      alpha=get_alpha();
   };
}
