require 'region_helper'
class Ngo < ActiveRecord::Base
	#has_many :regions, -> {where :region_for => 'Ngo'}, :foreign_key => 'region_for_id'
	include RegionHelper
	has_many :notifiers
end
