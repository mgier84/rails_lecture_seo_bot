require 'net/http'
require 'open-uri'
require 'seo_edit'
require 'seo_files'


class SEOMain

	include SEOEdit
    
  def initialize()
    @expression = /(\d{1,3})\.(\d{1,3})\.(\d{1,3})\.(\d{1,3})/
  end
  
  def getIPs(webcontent, logcontent)
    logcontent.each do |row|
      ip = row.match(@expression).to_s
      ua = row.to_s
      ua = editUA(ua)
      webcontent.each do |row2|
        ip2 = row2.match(@expression).to_s
        ua2 = row2.to_s
        ua2 = editUA(ua2)
        if(ip2 == ip)
          printMatch(ip2)
        end
        if(ua2 == ua)
          printMatch(ua2)
        end
      end
    end
  end
  
end


include SEOFiles

begin
	webcontent = getWeb
	logcontent = getLog

	bot = SEOMain.new
	bot.getIPs(webcontent, logcontent)
rescue StandardError => bang
	puts "Error: " + bang
ensure
	logcontent.close unless logcontent.nil?
end

