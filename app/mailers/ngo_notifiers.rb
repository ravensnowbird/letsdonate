class NgoNotifiers < ActionMailer::Base
  default from: "notifier@letsdonate.com"
  def send_notifie(ngo,notifier,request)
  	@request = request
  	@ngo = ngo
  	@notifier = notifier
    subject = "test"
    @to = notifier.email
    mail(to: @to, subject: @subject) if @to
  end
  def send_accept_information_to_donor(food_response)
  	@food_response = food_response
  	subject = "Confirmed Your request"
    @to = food_response.food_donor.email
    mail(to: @to, subject: @subject) if @to
  end
  def send_transport_request(transport)
  	@transport = transport
	subject = "Transport request"
    @to = food_response.food_donor.email
    mail(to: @to, subject: @subject) if @to
  end
  def accepted_transport_inform_to_donor(food_response,transport)
  	@food_response = food_response
  	@transport = transport
  	subject = "Accepted transport request"
    @to = food_response.food_donor.email
    mail(to: @to, subject: @subject) if @to

  end
  def accepted_transport_inform_to_ngo(food_response,transport)
 	@food_response = food_response
 	@transport = transport
 	subject = "Accept Transport request"
    @to = food_response.food_donor.email
    mail(to: @to, subject: @subject) if @to
  end
end
