require 'open-uri'
require 'cgi'
require 'nokogiri'

module Weather
  class Report
    attr_reader :conditions
    attr_reader :temperature
    def initialize(postal_code)
      @postal_code = postal_code
    end

    def retrieve
      url = "http://www.wunderground.com/cgi-bin/findweather/hdfForecast?query=#{CGI.escape(@postal_code)}"
      doc = Nokogiri::HTML(open(url))
      condition_element = doc.css('#curCond').first
      temp_element = doc.css('#rapidtemp span.b').first

      if condition_element
        @conditions = condition_element.content
      end

      if temp_element
        @temperature = temp_element.content
      end
    end
  end
end
