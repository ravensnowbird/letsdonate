module RegionHelper
	def regions
		all = Region.where({:regionfor => self.class.name}, {:regionforid => self.id.to_s})
	end
	def add_regions(regions)
		regions.each do |region|
			region[:regionfor] = self.class.name
			region[:regionforid] = self.id.to_s
			region[:coord] = {}
			region[:coord][:x] = region.delete(:lat)
			region[:coord][:y] = region.delete(:lang)
			r = Region.new_from_hash(region)
			r.save
		end
	end
	def show_region(id)
		Region.fing(id)
	end
	def update_region(id,values = {})
		region = show_region(id)
		values.each do |key,val|
			if [:lat,:lang].include? key
				region[:coord][x] = val if key == :lat
				region[:coord][y] = val if key == :lang
			else
				region[key] = val
			end
		end
		region.update(region)
	end

	def destroy_region(id)
		region = show_region(id)
		region.destroy
	end

end