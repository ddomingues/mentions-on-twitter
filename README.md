# mentions-on-twitter [![Code Climate](https://codeclimate.com/github/ddomingues/mentions-on-twitter/badges/gpa.svg)](https://codeclimate.com/github/ddomingues/mentions-on-twitter)

This project shows tweets and tweets by user about an user in twitter.

[Live Demo](http://mentions-on-twitter.herokuapp.com)

## Dependencies

To run this project you need to have:

* Ruby 2.1.2 - You can use [RVM](http://rvm.io)

## Setup the project

1. Install the depedencies above
2. `$ git clone https://github.com/ddomingues/mentions-on-twitter.git` - Clone the project
3. `$ cd mentions-on-twitter` - Go into the project folder
4. `$ bundle install` - Install the gem dependencies
6. `$ bundle exec rake spec` - Run the specs to see if everything is working fine

If everything goes OK, you can now run the project!

You can see an example here: http://showterm.io/6a0054fb8b6b53a56ef2c#slow

## Running the project

1. `$ bundle exec foreman start` - Opens the server
2. Open [http://localhost:3000](http://localhost:3000)

#### Running specs and checking coverage

`$ bundle exec rake spec` to run the specs.

`$ coverage=on bundle exec rake spec` to generate the coverage report then open the file `coverage/index.html` on your browser.
