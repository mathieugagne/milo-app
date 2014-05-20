##Getting started

####Get all your dependencies right
```
$ bundle
```

####Migrate & prepare your database

```
$ rake db:migrate db:seed projects:fake users:fake
```

####Start solr with Foreman

```
$ bundle exec foreman start
```

####Start your server
In a second tab:

```
$ rails s
```

####Login

Username: admin@demo.com
Password: foobar11