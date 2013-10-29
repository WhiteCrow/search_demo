require 'faye_client'
class SearchJob
  @queue = :search_job
  def self.perform(session_id,kw)
    d  = ::FayeClient.send("/search/#{session_id}",{:result => kw})
    d.join
  end
end
