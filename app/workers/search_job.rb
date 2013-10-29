require 'faye_client'
class SearchJob
  @queue = :search_job
  def self.perform(type,session_id,kw)
    result = facebook(kw)
    d  = ::FayeClient.send("/search/#{session_id}",{:result => result})
    d.join
  end

  def self.facebook(kw)
    kw
  end

  def self.twitter(kw)
    kw
  end
end
