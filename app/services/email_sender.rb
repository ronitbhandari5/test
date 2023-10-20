class EmailSender
  def send_email(from,to, subject, body)
    MyMailer.send_email(from,to, subject, body).deliver
  end
end