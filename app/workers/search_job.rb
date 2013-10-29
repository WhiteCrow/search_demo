require 'faye_client'
class SearchJob
  @queue = :search_job
  def self.perform(method,session_id,kw)
    result = Search.send(method, kw)
    d  = ::FayeClient.send("/search/#{session_id}",{:result => result})
    d.join
  end
end
