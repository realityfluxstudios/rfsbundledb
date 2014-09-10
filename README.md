RFS Bundle DB
=============

Still in development. At this point you can clone the repo then you must run `bower install`.
    
If you happen to use **RubyMine** (which I highly recommend as an IDE for Ruby on Rails Development) 
you have to copy the contents of the components directory into the javascripts directory so that
RubyMine doesn't yell at you for not being able to resolve the path to the javascript files. 

If you are not using RubyMine all you have to do is run `bower install` and the assets will be in the right place anyway.

Prerequisites
=============

* Ruby on Rails 4.1.4
* Ruby 2.1.2p95
* Bower
* Ubuntu (Just a recommendation, it's what I use on my web servers and I'll be able to give better support on setting this 
up if you are using the same OS)

Importing Data
==============

~~I was trying to create a form within the website that allows the pasting of the JSON and clicking a button to import the 
data. Initially I wrote a rake task to import my JSON files into the database. I think that is the best way to import data.
There is currently no checking for duplicate entries in the database. I will work on this for the Humble Bundle data.~~
 
 To import date you must use the rake task I wrote. the command is `rake import_hb['/full/path/to/file.json']` or 
 `rake import_ig['/full/path/to/file.json']`. This rake task will always be up to date with the latest schema. if there are
 any errors please report them via the issues. 

Indie Gala
==========

Nothing special for this site. It is pretty straight forward. Go to each gift url and click the RFS Bundle Scraper bookmarklet. For multiple
copies of a single bundle just go to the subsequent gift urls and open the bookmarklet again. It will automatically 
combine the data properly. 

IG's DRM free stuff is not protected in any way so the URLs are good forever. Guard these URLs because if they get out then
the developers are getting cheated if people just download their games without paying. They released their games DRM free
with the trust in their fans that they wouldn't betray their intellectual property rights. 

**Note** There is currently no check to see if it is the correct bundle it's combining with, so in the case of a mistaken
combination, just clear the data and refresh the bookmarklet.

Humble Bundle
=============
With HumbleBundle it's pretty much the same thing. The main library page is ALL of the DRM free files. This can be scraped
as well and I will be using this data as a way to update all the URLs for the drm free stuff in the database. As it stands
right now (Sept 10) it will not detect duplicates. This same information is given within the individual bundles. I prefer
to get the information from the bundles first and then use the main library page to update the urls as needed (eventually). 