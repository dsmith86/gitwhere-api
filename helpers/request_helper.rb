class Sinatra::Request
	def payload
		self.body.rewind
		
		JSON.parse self.body.read
	end
end