class NgoNotifiers < ActionMailer::Base
  default from: "notifier@letsdonate.com"
  def send_notifie(ngo,notifier,request)
  	@ngo = ngo
  	@notifier = notifier
    subject = "test"
    to = notifier.email
    mail(to: @to, subject: @subject).deliver if to
  end
 

end
