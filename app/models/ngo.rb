require 'region_helper'
class Ngo < ActiveRecord::Base
	#has_many :regions, -> {where :region_for => 'Ngo'}, :foreign_key => 'region_for_id'
	include RegionHelper
	has_many :notifiers
	after_create :create_notifier


	private

	def create_notifier
		self.notifiers.create()
	end

end
