require 'region_helper'
class Ngo < ActiveRecord::Base
	#has_many :regions, -> {where :region_for => 'Ngo'}, :foreign_key => 'region_for_id'
	include RegionHelper
	has_many :notifiers, :dependent => :destroy
	accepts_nested_attributes_for :notifiers
	belongs_to :user
	has_many :food_responces
	after_create :create_notifier

	def create_notifiers(params)
		params.each do |key,val|
			if key.include? "notify_"
				self.notifiers.create(:name => val[:name],:phone => val[:phone],:email => val[:email])
			end
		end
	end

  def self.current=(user)
    Thread.current[:current_user] = user
  end

  def self.current
    Thread.current[:current_user]
  end

	private

	def create_notifier
		self.notifiers.create(:name => self.name, :email => Ngo.current.email)
	end

end
