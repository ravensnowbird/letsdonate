require 'region_helper'
class FoodDonor < ActiveRecord::Base
has_many :list_items
has_many :food_responces
#has_many :regions, -> {where :region_for => 'FoodDonor'}, :foreign_key => 'region_for_id'
include RegionHelper

def send_notifications(ngo_ids)
	ngo_ids = ngo_ids.collect!{|n| n.to_i}
	ngos = Ngo.where(:id => ngo_ids) if ngo_ids.present?
	ngos.each do |ngo|
		request = food_responces.create(:ngo => ngo, :status => 'Request Sended')
		ngo.notifiers.each do |notifier|
			::NgoNotifiers.send_notifie(ngo,notifier,request)
		end
	end
end
end
