import org.json.me.*;
import java.util.*;
NodeList nl;
PFont font;
EdgeList el;
long time=0;
int ottl=60*60*24*30*6;
boolean record=false;

JSONArray jo;

MailList ml;

Mail m;
int step=60*60;

void setup() {
   size(1024,768,P2D);
   font=loadFont("DejaVuSansCondensed-Bold-44.vlw");
   textFont(font,44);
   el=new EdgeList();
   nl=new NodeList(el);
   String[] f=loadStrings("/home/mihi/Source/visualizemail/mypmails.json");
   //String[] f=loadStrings("/home/mihi/Source/visualizemail/test.json");
   String l=join(f,"");
   try {
   jo=new JSONArray(l);
   ml=new MailList(jo);
   }
   catch (JSONException ex) {
     println(ex);
   }
    m=ml.next();
   time=m.date;
  nl.create_from_mail(m);
    m=ml.next();
}

void showtime() {
   Date d=new Date(time*1000);
   fill(128,128,255,128);      
   text(DateFormat.getDateInstance().format(d),20,height-20);
};
void draw() {
   background(0);
   el.draw(); 
   nl.draw();
   el.move();
   el.clean();
   nl.move();
   nl.clean();
   nl.collision();
   time=time+step;
   if (m.date<=time) {
         nl.create_from_mail(m);
         m=ml.next();
   
   }
  showtime();
  if (record) {
    saveFrame("/tmp/vid/frame-#######.png");
  };
}


void mousePressed() {
    Mail m=ml.next();
    nl.create_from_mail(m);
    /*Node n=nl.node_add("asdf");
    el.add(new Edge(n,nl.get_random())); */
}
