import os,mail.parser

class Walker: 
        def __init__(self,dir):
                self.dir=dir

        def walk(self):
                w=os.walk(self.dir)
                r=[]
                for (wd,dirs,files) in w:
                        for f in files:
                                fp=open(os.path.join(wd,f))
                                p=mail.parser.Parser()
                                p.parse(fp)
                                try:
                                        r.append(p.get_md5_dict())
                                except:
                                        pass
                return r                
        def plain_walk(self):
                w=os.walk(self.dir)
                r=[]
                for (wd,dirs,files) in w:
                        for f in files:
                                fp=open(os.path.join(wd,f))
                                p=mail.parser.Parser()
                                p.parse(fp)
                                try:
                                        r.append(p.get_dict())
                                except:
                                        pass
                return r                

                
      
