class EdgeList {
    ArrayList nl;

    
    EdgeList() {
        nl=new ArrayList();
    }
    
    
    Edge add(Edge n) {
        nl.add(n);
        return n;
    }
    
    void draw() {
      for (int i=nl.size()-1;i>=0;i--) {
        Edge n=(Edge) nl.get(i);
        n.draw();
      }
    }
    
    void move() {

        for (int i=0;i<nl.size();i++) {
          Edge n=(Edge) nl.get(i);
          n.move();
        }
    }
    void clean() {
        for (int i=0;i<nl.size();i++) {
            Edge n=(Edge) nl.get(i);
            if (n.ttls.size()==0) {
                nl.remove(i);
            }
        }
    }
    
    Edge edge_add(Node from, Node to) {
      for (int i=0;i<nl.size();i++) {
          Edge e=(Edge) nl.get(i);
          if ((e.a.id.equals(from.id) && e.b.id.equals(to.id))|(e.a.id.equals(to.id) && e.b.id.equals(from.id))) {
              e.ttls.add(ottl);
              return e;
          }
          
      }
      Edge e=new Edge(from,to);
      add(e);
      return e;
    }
    
}
