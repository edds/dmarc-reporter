# DMARC Reporting Tool

A Rails app to parse DMARC report emails and show the results in a web UI.

Includes a ruby DMARC report parser in `./lib/parse_dmarc.rb`

Can be used on heroku using cloudmailin to convert emails to HTTP
or on your own server using [mailman][1] to fetch emails from stdin/imap/pop3/maildir.

# Installation using mailman

**WARNING** When using pop3, mailman will delete emails after being processed.

* `git clone https://github.com/edds/dmarc-reporter.git`
* `cd dmarc-reporter`
* `gem install bundler`
* `bundle install`
* edit config/database.yml to match your setup
* add your mailserver setup to config/initializers/mailman.rb
* `rake db:create`
* `rake db:migrate`
* `rails server` # the web ui
* `ruby script/mailman` # the mail processor


# Installation on Heroku

**this assumes you are deplying to [heroku][2] and already have the heroku
[toolbelt][3] setup and working**

* `git clone https://github.com/edds/dmarc-reporter.git`
* `cd dmarc-reporter`
* `heroku create`
* `heroku config:add SITE_USER=user SITE_PASS=password`
* `git push heroku master`
* `heroku run rake db:migrate`
* `heroku addons:add cloudmailin`
* `heroku config`
* Using `CLOUDMAILIN_USERNAME` and `CLOUDMAILIN_PASSWORD` as displayed by the
  previous command login to [cloudmailin][4] and set up a email forward to
  `http://user:password@project_name.herokuapp.com`.
* Set the email address that receives your DMARC reports to forward to the
  address listed as `CLOUDMAILIN_FORWARD_ADDRESS`

[1]: https://github.com/titanous/mailman
[2]: http://heroku.com
[3]: https://toolbelt.herokuapp.com/
[4]: https://www.cloudmailin.com/

