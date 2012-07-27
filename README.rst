========================================
Visualizing Emails
========================================

Introduction
------------

The European `Data Retention Directive`_ requires email providers to store
communications data for 6 to 24 months. This data can be used to
construct and explore social networks to deduct information such as
organization structure in groups. Although it is often criticized for
intruding our privacy the topic is still very abstract.

This is an experiment of displaying how visualized data looks like and what
potentially can be deduced from it. 

On the Data
-----------

The data included as file *mypmails.json* is an anonymized set of emails I
received and sent during working in a lab from 2008-2011. I chose this data
set because it displays usual worklife email behavior (relatively little
lists etc.). 

The data is extracted from maildirs using the python scripts. *jsonfile.py*
walks a mail directory (set in the source as */home/mihi/Mail*) and prints
json formatted data. 

Visualizing the Data
--------------------

The data visualization part is done using `Processing`_. The sketches are
in the *processing/* folder - including a copy of the `org.json.me`_
framework. A video showing the result is available on Vimeo:
http://vimeo.com/35516153

Requirements
------------

* Python 2.7
* `Processing`_.org
* `org.json.me`_ (included)

.. _Data Retention Directive: http://en.wikipedia.org/wiki/Data_Retention_Directive
.. _Processing: http://processing.org
.. _org.json.me: https://github.com/upictec/org.json.me/
