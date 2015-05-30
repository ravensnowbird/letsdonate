class FoodResponce < ActiveRecord::Base
  belongs_to :ngo
  belongs_to :food_donor
  #has_many :regions, -> {where :region_for => 'FoodResponce'}, :foreign_key => 'region_for_id'
  include RegionHelper
end
