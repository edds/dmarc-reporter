# To use a specific backend uncomment one of the following

#Mailman.config.pop3 = {
#  username: 'chunkybacon@gmail.com',
#  password: 'foobar',
#  server: 'pop.gmail.com',
#  port: 995, # defaults to 110
#  ssl: true # defaults to false
#}

#Mailman.config.imap = {
#  server: 'imap.gmail.com',
#  port: 993,  # usually 995, 993 for gmail
#  ssl: true,
#  username: 'foo@somedomain.com',
#  password: 'totallyunsecuredpassword'
#  folder: 'INBOX'
#}

#Mailman.config.maildir = "/var/vmail/domain.tld/dmarc"

Mailman.config.logger = Logger.new(Rails.root.join('log/mailman.log'))
