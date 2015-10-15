# Media collections manager

You could easily manage your media resources with this application.

# General requirements 

* Rails
* Sqlite3
* Bootrstrap

# Installation

Do the following steps:

```
$ git clone https://github.com/ksukhorukov/Media
$ cd Media
$ rvm use ruby-2.1.5@applift --create
$ bundle
$ rake db:setup
$ rake db:seed
$ rake test
$ rails s
```

### API

```curl --data "word=test" http://localhost:3000/search.json```

```{"links":[{"name":"test","link":"http://localhost:3000/items/1"}]}```

### [EOF]


