class RnboProvider < BaseProvider
  def receive_data(url)
    uri = URI(url)

    Net::HTTP.start(uri.host, uri.port) do |http|
      request = Net::HTTP::Get.new uri

      http.request request do |response|
        open "sanctions", "w" do |io|
          response.read_body do |chunk|
            io.write chunk
          end
        end
      end
    end
  end

  def validate_source
    
  end
end

