class DataTransmitService
  attr_reader :client
  attr_reader :stubs

  def initialize
    @stubs = Faraday::Adapter::Test::Stubs.new
    # @client = Faraday.new(:url => "https://endpoint_to_recieve_data/") do |faraday|
    #   faraday.request  :url_encoded
    #   faraday.response :logger
    #   faraday.adapter  Faraday.default_adapter
    # end
  end

  def transmit(data)
    stubs.get('/foo') { [200, {}, ''] }
    # parse_json(client.post(data, "Content-Type" => "application/json"))
  end

  private

  def parse_json(res)
    JSON.parse(res.body, symbolize_names: true)
  end
end
