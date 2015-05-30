require 'region_helper'
class FoodDonor < ActiveRecord::Base
has_many :list_items
has_many :food_responces
#has_many :regions, -> {where :region_for => 'FoodDonor'}, :foreign_key => 'region_for_id'
include RegionHelper

end
