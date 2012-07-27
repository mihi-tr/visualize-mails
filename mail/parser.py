import email.utils, email.parser, time, hashlib,re

class Parser:
        def __init__(self):
                self.p=email.parser.Parser()
                self.mail=re.compile("([a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+)")

        def parse(self,fp):
                self.message=self.p.parse(fp)

        def parsestring(self,str):
                self.message=self.p.parsestring(str)
        
        def get_from(self):     
               ft=self.message.get("From")
               return self.get_addresses(ft)[0]
        
        def get_recipients(self):
                ft=self.message.get("To")
                ft+=self.message.get("cc","")
                return self.get_addresses(ft)
               
        def get_addresses(self,string):
                return [i.lower() for i in self.mail.findall(string)]
        
        def get_timestamp(self):
                return time.mktime(email.utils.parsedate(self.message.get("Date")))
        
        def get_dict(self):
                return {"date":self.get_timestamp(),"from":self.get_from(),"to":self.get_recipients()}
        
        def md5(self,string):
                if type(string)==list:
                        return [hashlib.md5(i.lower()).hexdigest() for i in string]
                else:
                        return hashlib.md5(string.lower()).hexdigest()

        def get_md5_dict(self):
                return {"date":self.get_timestamp(),
                        "from":self.md5(self.get_from()),
                        "to":self.md5(self.get_recipients())}
