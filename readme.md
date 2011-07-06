About:
------
This is a simple script to download/scrape a list of financial institutions from the Fed.
It uses DataMapper as an ORM, Sqlite for the database storage, and Minitest for testing.

To install:
-----------
    git clone git@github.com:jakeonrails/fed_ach_parser.git
    bundle install

To run:
-------
    ruby ach.rb

The Sqlite database should be created for you in db/ach.db.
    
To test:
--------
    ruby test_institution.rb
    
Notes:
------
DataMapper will give you a warning when you run this because of some deprecations in DataObjects. This is a known issue, waiting for a fix, but will not affect the program.

