import mail.dir

md="/home/mihi/Mail"
edges=set()
walker=mail.dir.Walker(md)
for w in walker.plain_walk():
        f=w["from"]
        for t in w["to"]:
                edges.add("x%s->x%s"%(f,t))

print "digraph G {"
print 'node [shape=circle, style=filled, label="", height=0.25]'
for e in edges:
        print e
print "}"        
