class MailList {
  int index=0;
  ArrayList ml;
 
 MailList(JSONArray ja) {
   ml=new ArrayList();
   for (int i=0;i<ja.length();i++) {
       try {
       JSONObject jo=(JSONObject) ja.get(i);
       Mail m=new Mail(jo);
       ml.add(m);
       }
       catch (JSONException ex) {
           println(ex);
       }
      
   };
 }
 
 Mail next() {
   if (index>=ml.size()) {
       index=0;
       record=false;
       setup();
   }
   Mail r=(Mail) ml.get(index);
   index++;
   return r;
 };
 
  
}
