require 'region_helper'
class FoodResponce < ActiveRecord::Base
  belongs_to :ngo
  belongs_to :food_donor
  #has_many :regions, -> {where :region_for => 'FoodResponce'}, :foreign_key => 'region_for_id'
  include RegionHelper

  def after_update_action
  	if status == "AcceptedWithTransport"
  		send_accept_information_to_donor
  		self.update(:status => "complete")
  	elsif status == "AcceptedWithoutTransport"
  		send_transport_request
  		self.update(:status => 'TranseportRequestSended')
  	end
  end
  def send_accept_information_to_donor
  	NgoNotifiers.send_accept_information_to_donor(self)

  end

  def send_transport_request
  	Transport.all.each do |taransport|
  		NgoNotifiers.send_transport_request(self,taransport)
  	end
  end
  def accepted_transport(transport)
  	NgoNotifiers.accepted_transport_inform_to_donor(self,transport)
  	NgoNotifiers.accepted_transport_inform_to_ngo(self,transport)
  end

end
