module RegionHelper
	def regions
		begin
			Region.where({:regionfor => self.class.name, :regionforid => self.id.to_s})
		rescue
			[]
		end
	end
	def add_regions(regions)
		begin
		regions.each do |region|
			region[:regionfor] = self.class.name
			region[:regionforid] = self.id.to_s
			region[:coord][:x] = region[:coord].delete(:lat) if region[:coord]
			region[:coord][:y] = region[:coord].delete(:lang) if region[:coord]
			r = Region.new_from_hash(region)
			r.save
		end
	rescue
	end
	end
	def show_region(id)
		begin
			Region.find(id)
		end
		rescue
			Region.new
		end
	end
	def update_region(id,values = {})
		begin
		region = show_region(id)
		values.each do |key,val|
			if [:lat,:lang].include? key
				values[:coord][x] = values.delete(:lat) if key == :lat
				values[:coord][y] = values.delete(:lang) if key == :lang
			end
		end
		region.update(region)
	rescue
	end
	end

	def destroy_region(id)
		begin
		region = show_region(id)
		region.destroy
		end
		rescue
	end
	end

end
