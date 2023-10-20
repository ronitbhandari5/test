class MyMailer < ApplicationMailer
  def send_email(from,to, subject, body)
    mail(from: from,to: to, subject: subject) do |format|
    format.text { render plain: body }
    end
  end
end