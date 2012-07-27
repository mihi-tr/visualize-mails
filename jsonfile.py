import json, mail.dir

walker=mail.dir.Walker("/home/mihi/Mail")

r=walker.walk()
nr=sorted(r, key=lambda x: x['date'])

print json.dumps(nr)
