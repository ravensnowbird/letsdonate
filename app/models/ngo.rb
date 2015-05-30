class Ngo < ActiveRecord::Base
	has_many :regions, -> {where :region_for => 'Ngo'}, :foreign_key => 'region_for_id'
	has_many :notifiers
end
