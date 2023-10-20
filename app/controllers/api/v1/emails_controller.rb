class Api::V1::EmailsController < ApplicationController
  skip_before_action :verify_authenticity_token 
  def send_email
    from = params[:from]
    to = params[:to]
    subject = params[:subject]
    body = params[:body]

    email_sender = EmailSender.new
    email_sender.send_email(from,to, subject, body)

    render json: { message: 'Email sent successfully' }
  end

  def fetch_emails
    server = 'imap.gmail.com' 
    username = params[:username]
    password = params[:password]
    mailbox = params[:mailbox] || 'INBOX'

    email_fetcher = EmailFetcher.new(server, username, password)
    emails = email_fetcher.fetch_emails(mailbox)

    render json: emails
  end

end
