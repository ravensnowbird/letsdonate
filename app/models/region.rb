class Region < ClusterPoint::Document
	contains :coord
	def address
		self[:address] if self.id
	end
	def lat
		self[:coord][:lat]  if self.id
	end
	def lang
		self[:coord][:lang]  if self.id
	end
end
