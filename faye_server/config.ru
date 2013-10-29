require 'faye'
Faye::WebSocket.load_adapter('thin')
# change you access token

FAYE_TOKEN = "4a0af78efe567"

app = Faye::RackAdapter.new(:mount => '/faye', :timeout => 25)
class FayeAuth
  def incoming(message, callback)
    if message['channel'] !~ %r{^/meta/}
      if message["data"]
        if message["data"]['token'] != FAYE_TOKEN
          message['error'] = "Faye authorize faild."
        else
          message["data"].delete('token')
        end
      end
    end
    callback.call(message)
  end
end
app.add_extension(FayeAuth.new)

run app
