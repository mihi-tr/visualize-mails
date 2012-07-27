class NodeList {
    ArrayList nl;
    EdgeList el;
    
    NodeList(EdgeList nel) {
        nl=new ArrayList();
        el=nel;
    }
    NodeList () {
      nl=new ArrayList();
      el=new EdgeList();
    }
    
    
    Node add(Node n) {
        nl.add(n);
        return n;
    }
    
    void draw() {
      for (int i=0;i<nl.size();i++) {
        Node n=(Node) nl.get(i);
        n.draw();
      }
    }
    
    void move() {

        for (int i=0;i<nl.size();i++) {
          Node n=(Node) nl.get(i);
          n.move();
        }
    }
    
    void collision() {

        for (int i=0;i<nl.size();i++) {
          Node n=(Node) nl.get(i);
          n.collision(nl);
        }
    }
    void clean() {
        for (int i=0;i<nl.size();i++) {
            Node n=(Node) nl.get(i);
            if (n.alpha<1) {
                nl.remove(i);
            }
        }
    }
    
    Node get_random() {
      int r=int(random(nl.size()));
      return (Node) nl.get(r);
    }
    
    Node node_add(String id) {
      for (int i=0;i<nl.size();i++) {
         Node n=(Node) nl.get(i);
         if (n.id.equals(id)) {
           return n;
         }
      }
      Node n=new Node(id);
      nl.add(n);
      return n;
    
    }
    Node node_add(String id, int x, int y) {
      for (int i=0;i<nl.size();i++) {
         Node n=(Node) nl.get(i);
         if (n.id.equals(id)) {
           return n;
         }
      }
      Node n=new Node(id,x,y);
      nl.add(n);
      return n;
    
    }
    
    boolean has_node (Node n) {
      for (int i=0; i<nl.size();i++) {
        Node n1=(Node) nl.get(i);
        if (n.id.equals(n1.id)) {
            return true;
        };
      }
      return false;
    }
    
    void create_from_mail(Mail m) {
    if (m.to.length<10) {
    Node n1=node_add(m.from);
    n1.ttl=ottl;
    for (int i=0;i<m.to.length;i++) {
      Node n2=node_add(m.to[i],n1.position_x,n1.position_y);
      n2.ttl=ottl;
      el.edge_add(n1,n2);
    }
    };
    }
    
    
}
