class Transporter < ActiveRecord::Base
	has_many :regions, -> {where :region_for => 'Transporter'}, :foreign_key => 'region_for_id'
	belongs_to :user
end
