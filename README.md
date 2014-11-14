[![Code Climate](https://codeclimate.com/github/leopoldkwok/bookmarkmanager/badges/gpa.svg)](https://codeclimate.com/github/leopoldkwok/bookmarkmanager)  [![Test Coverage](https://codeclimate.com/github/leopoldkwok/bookmarkmanager/badges/coverage.svg)](https://codeclimate.com/github/leopoldkwok/bookmarkmanager)
Bookmark Manager
================

This week's project is a bookmark manager. The goal is to expose you to the following aspects of web development, in addition to what we've studied before:

Integration testing: Capybara (Monday)  
Relational databases (Tuesday and Wednesday)  
Security considerations (Thursday)  


High-level specification
-------------------------

A bookmark manager is a website to maintain a collection of links, organised by tags. You can use it to save a webpage you found useful. You can add tags to the webpages you saved to find them later. You can browse links other users have added.

The website will have the following options:

* Show a list of links from the database
* Add new links
* Add tags to the links
* Filter links by a tag

Technologies used
------------------

* Ruby
* PostgreSQL
* CSS (custom)
* Testing in RSpec/Capybara
* Sinatra
* Bcrypt
* CSS
* HTML
* DataMapper


How to use
-----------

Clone the repository:

```shell
$ git clone git@github.com:leopoldkwok/bookmarkmanager.git
```


Change into the directory:

```shell
$ cd bookmarkmanager
```

Run bundle to load the required gems:

```shell
$ bundle install
```

Ensure you have PostgresSQL installed.

You will need to create a database locally:

```shell
$ psql
=# CREATE DATABASE 'bookmark_manager_test';
```

Migrate the required tables:

```shell
$ rake auto_migrate
```

Run Rspec:
```shell
$ rspec
```

To run:
```shell
$ rakeup
```
open a web browser and type localhost:9292