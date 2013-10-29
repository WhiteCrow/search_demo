class Search
  class << self
    #def with_linkedin_users(key_words)
    #  client = LinkedIn::Client.new('0ctqnsczmz3a', 'k184ZjS6JhEyq7os')
    #  client.authorize_from_access("31e7f763-fa05-47e9-9302-d067a155d74c", "6a33c211-09f0-48a6-99fc-19880665497a")
    #  client.search(key_words)["people"]["all"].map do |people|
    #    {name: people["first"]}
    #  end
    #end

    def with_twitter_tweets(keywords)
      Twitter.search(keywords, result_type: "recent").results.map do |status|
        {name: status.from_user, text: status.text, image_url: status.profile_image_url}
      end
    end
  end
end
