# README

##### Prerequisites

The setups steps expect following tools installed on the system.

- Github
- Ruby [2.7.1](https://github.com/mohamedtaha123/moviio/blob/master/.ruby-version#L1)
- Rails [6.0.0](https://github.com/mohamedtaha123/moviio/blob/master/Gemfile#L12)

##### 1. Check out the repository

```bash
git clone git@github.com:mohamedtaha123/moviio
```


##### 2. Create and setup the database

Run the following commands to create and setup the database.

```ruby
bundle exec rake db:create
bundle exec rake db:setup
```

##### 3. Start the Rails server

You can start the rails server using the command given below.

```ruby
bundle exec rails s
```

And now you can visit the site with the URL http://localhost:3000

#### 4. Run Tests (Rspec)
You can start the tests using the command given below.

```ruby
bundle exec rspec 
```
