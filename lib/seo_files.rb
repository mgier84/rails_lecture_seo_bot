module SEOFiles

	def getWeb()
		url = "http://www.iplists.com/nw/google.txt"
		file = open(url, 'User-Agent' => 'ruby')
		return file.read
	end	
	
	def getLog()
		return File.open("../log/apache-combined.log", "r")
	end
	
end

