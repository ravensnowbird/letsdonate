require 'region_helper'
class Transporter < ActiveRecord::Base
	#has_many :regions, -> {where :region_for => 'Transporter'}, :foreign_key => 'region_for_id'
	include RegionHelper
	belongs_to :user
end
