require 'net/http'
class FayeClient
  def self.send(channel, params)
    Thread.new {
      params[:token] = Settings.faye_token
      message = {:channel => channel, :data => params}
      uri = URI.parse(Settings.faye_server)
      p uri, message
      Net::HTTP.post_form(uri, :message => message.to_json)
    }
  end
end
