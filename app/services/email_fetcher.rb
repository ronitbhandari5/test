
require 'net/imap'
require 'mail' # If you're using the 'mail' gem

class EmailFetcher
  def initialize(server, username, password)
    @imap = Net::IMAP.new(server, ssl: true)
    @imap.login(username, password)
  end

  def fetch_emails(mailbox)
    @imap.select(mailbox)
    email_ids = @imap.search(['ALL'])

    email_ids.each do |email_id|
      email_data = @imap.fetch(email_id, 'RFC822')
      email = Mail.new(email_data[0].attr['RFC822'])

      # Save the email to your database or do whatever you need to with it
    end
  end
end

require 'net/imap'
require 'mail'

class EmailFetcher
  def initialize(server, username, password)
    @imap = Net::IMAP.new(server, ssl: true)
    @imap.login(username, password)
  end

  def fetch_emails(mailbox)
    @imap.select(mailbox)
    email_ids = @imap.search(['ALL'])
    emails = []

    email_ids.each do |email_id|
      email_data = @imap.fetch(email_id, 'RFC822')
      email = Mail.new(email_data[0].attr['RFC822'])
      emails << email
    end

    emails
  end
end