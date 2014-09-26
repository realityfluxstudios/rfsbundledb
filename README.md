RFS Bundle DB
=============

This website is a companion project to be used in conjunction with the [RFS Bundle Scraper](https://github.com/realityfluxstudios/RFSBundleScraper). 
It is pretty worthless without the JSON that is created using the Bundle Scraper.

If you happen to use **RubyMine** (which I highly recommend as an IDE for Ruby on Rails Development) 
you have to copy the contents of the components directory into the javascripts directory so that
RubyMine doesn't yell at you for not being able to resolve the path to the javascript files. 

If you are not using RubyMine:
 1. Run `bower install` in the root directory of the project. Wait for bower to download the needed assets
 2. Run `bundle install` in the root directory of the project and wait for the gems to download.
 3. Run `rake db:migrate` to create the .sqlite3 file for the database
 4. Import data using the rake tasks as outlined below.
 5. Run `rails s` to start the server.
 6. Visit `localhost:3000` to visit the website. Until you import data it wil be empty, of course.
 7. Please give me feedback in the issues area or email me Thomas[at]RealityFluxStudios[dot]com

Prerequisites
=============

* Ruby on Rails 4.1.4 check out this [YouTube Video](http://www.youtube.com/watch?v=ih4txNf7w_U) video for instructions on how to set up `Ruby on Rails` on **Windows**.
* Ruby 2.1.2p95
* Bower
* Ubuntu (Just a recommendation, it's what I use on my web servers and I'll be able to give better support on setting this 
up if you are using the same OS)

Importing Data
==============

I was trying to create a form within the website that allows the pasting of the JSON and clicking a button to import the 
data. Initially I wrote a rake task to import my JSON files into the database. I think that is the best way to import data.
There is currently no checking for duplicate entries in the database. I will work on this for the Humble Bundle data. The command 
is `rake import_hb['/full/path/to/file.json']`, `rake import_ig['/full/path/to/file.json']`, or `rake import_bs['/full/path/to/file.json']`. 
This rake task will always be up to date with the latest schema. if there are any errors please report them via the issues. 

Editing Data
============

This is the next major thing I will be working on and the site will basically be done once this is complete.

I will be including two fields that will seem like unnecessary duplication of data, but it is required to maintain integrity
of the data. `title_slug_raw` and `title_raw` will be unique and not modifiable at all. The `title` and `title_slug` will be able
to be modified for aesthetic purposes and will be the ones used in URLs and displayed on the site. the `_raw` versions will
be used internally for comparison purposes.

There will be a field in both the games and bundles table for the transaction ID so that you can have a easy reference to it in the databse
there is currently no way to retrieve that information automatically, but it'll be available in the view and edit page. It will
only show up in the view page if it is actually filled out.

Rake Tasks and Shell Scripts
============================

Use a sqlitedb viewer [Firefox Add-On](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager/) or a 
[Standalone SQL Browser](http://sqlitestudio.pl/?act=download) to give a quick glance at the database before running 
these commands. This will prevent any problems that might arise when you first run them. The most obvious problem would be a missing Title.

As outlined above, the way to import the JSON data gathered by the bookmarklet is via a rake task. Simply use 
`rake import_hb['/full/path/to/json/file']` and `rake import_ig['/full/path/to/json/file']`. I wrote a shell script that will 
loop through all the json files in the directory. Refer to the `import_all_bundles.sh` file in the `/lib/` directory. 

There is also a rake task `rake get_prices` that will retrieve all the pricing information for all the steam games in 
your database. This comes from the API of [Cheap Shark](http://www.cheapshark.com) which I highly recommend for finding the 
best deals for any games you want. Along with the pricing information we also get the rectangular icon that is displayed
on the steam pages. This will be used on the individual game pages on the website. 

For games from bundles other than Indie Gala you can add the steam ID required to get the pricing information manually. 
I will be adding a search feature that will query the Cheap Shark database and allow choosing of the correct result so that the
pricing information can be retrieved.

A new rake task is available `rake get_steam_info` will use the undocumented Steam API to get even more information about the 
games that have a valid SteamID. I am saving the detailed_description, about_the_game, developers name, developers website, 
categories and genres as listed on steam and a few other things. This is so that I can display all this information on the games
view page in the database site. The steam store url is available too and one can just click that link but I rather have everything 
at a glance instead of having to open a new tab for information about a given game.  