require 'soap/wsdlDriver'

class SoapWrapper
  attr_accessor :endpoint, :service
  
  # delete this method!
  def initialize(endpoint = nil, service = nil)
    @endpoint = endpoint
    @service = service
  end
  
  def update_results
    match_result = nil
    for match in Match.last_matches.matches_without_result do
      date_results = get_match_result_by_time(match.starts_at).matchdata
      
      if date_results.class == Array
        date_results.each do |result|
          match_result = result if result.nameTeam1.capitalize.eql? match.team_1.name.capitalize
        end
        
      else
        match_result = date_results
      end
      
      if match_result and match_result.nameTeam1 == match.team_1.name
        p "juhuu, hier :)"
        match.update_score(match_result)
      end
    end
  end
  
  def get_match_result_by_time(start_time)
    soap = wsdl.create_rpc_driver
    response = soap.getMatchdataByLeagueDateTime(:fromDateTime => start_time - 10.minutes, :toDateTime => start_time + 10.minutes, :leagueShortcut => 'wm2010')
    response.getMatchdataByLeagueDateTimeResult
  end
  
  def get_last_match_result
    soap = wsdl.create_rpc_driver
    response = soap.getLastMatch(:leagueShortcut => 'wm2010')
    #soap.reset_stream
    response.getLastMatchResult
  end
  
private
  def wsdl
    SOAP::WSDLDriverFactory.new("http://www.OpenLigaDB.de/Webservices/Sportsdata.asmx?WSDL")
  end
  
end
