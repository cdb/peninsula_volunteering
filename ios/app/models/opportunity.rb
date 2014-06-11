class Opportunity
  PROPERTIES = [:id, :title, :description, :date, :start_time, :end_time, :number_of_positions, :url]
  
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize(attributes = {})
    attributes.each { |key, value|
      
      if PROPERTIES.member? key.to_sym
        self.send("#{key}=", value) 
      end
    }
  end
  
  def self.find_all(&block)
    @response = nil
    BW::HTTP.get("https://peninsula-volunteering.herokuapp.com/opportunities.json?email=cameron@cdbdesign.net&token=jB2XyzkNZHyB4U1D1n9-") do |response|
      @response = response
      if response.ok?
        json = BW::JSON.parse(response.body.to_str)
        p json
        opps = []
        json.each do |item|
          opp = Opportunity.new(item)
          opps << opp
        end
        block.call(opps)
      elsif response.status_code.to_s =~ /40\d/
        App.alert("Login failed")
      else
        App.alert(response.error_message)
      end
    end
    @response
  end
end

