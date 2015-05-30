class Region < ClusterPoint::Document
	contains :coord
	def address
		self[:address]
	end
	def lat
		self[:coord][:lat]
	end
	def lang
		self[:coord][:lang]
	end
end
