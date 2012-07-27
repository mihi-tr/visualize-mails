class Mail {
  String from;
  String[] to;
  int date;

  
  Mail (JSONObject jo) {
    try {
      from=jo.getString("from");
      JSONArray jto=(JSONArray) jo.get("to");
      to=new String[jto.length()];
      for (int i=0;i<jto.length();i++) {
        to[i]=jto.getString(i);
      }
      date=int(jo.getString("date"));
          
    }
    
    catch (JSONException ex) {
        println(ex);
    };
  };
  
  
};
