# DMARC Reporting Tool

A Rails app to parse DMARC report emails and show the results in a web UI.

Includes a ruby DMARC report parser in `./lib/parse_dmarc.rb`

Designed to be run on heroku using cloudmailin to convert emails to HTTP.


# Installation

**this assumes you are deplying to [heroku][1] and already have the heroku
[toolbelt][2] setup and working**

* `git clone https://github.com/edds/dmarc-reporter.git`
* `cd dmarc-reporter`
* `heroku create`
* `heroku config:add SITE_USER=user SITE_PASS=password`
* `git push heroku master`
* `heroku run rake db:migrate`
* `heroku addons:add cloudmailin`
* `heroku config`
* Using `CLOUDMAILIN_USERNAME` and `CLOUDMAILIN_PASSWORD` as displayed by the
  previous command login to [cloudmailin][3] and set up a email forward to
  `http://user:password@project_name.herokuapp.com`.
* Set the email address that receives your DMARC reports to forward to the
  address listed as `CLOUDMAILIN_FORWARD_ADDRESS`


[1]: http://heroku.com
[2]: https://toolbelt.herokuapp.com/
[3]: https://www.cloudmailin.com/

