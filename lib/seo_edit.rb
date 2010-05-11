module SEOEdit

	def editUA(value)
    agent = value
    agent = agent.split(" ")
    agent = agent[(agent.size)-1]
    return agent
  end
  
  def printMatch(value)
    print "Uebereinstimmung: "
    puts value
  end

end

