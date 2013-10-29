class Search
  class << self
    def with_twitter_tweets(keywords)
      Twitter.search(keywords, result_type: "recent").results.map do |status|
        { type: 'twitter',
          name: status.from_user,
          text: status.text,
          image_url: status.profile_image_url}
      end
    end

    def with_facebook_users(keywords)
      response = HTTParty.get("https://graph.facebook.com/search\?q\=#{keywords}\&type\=user\&access_token\=CAACaTYwTQ4IBAMOJul655cYmvdbwLaj13szuZBZBnjbaQEt3SWNd5rv3DbSV4ej31Oan3iDy3SIF6ZBgN540O9bIHM6ZCqLdWY4mxZAn9x5j2nZBuXMZC18egeKsmjfBnedEwBeCfZA9tdypb08WKPvnxcEqksHSb0sGPAyZCNDqgrIK9RF3wZChgvklnY77fJqnZA3h5kg7yZCsZBgZDZD&fields\=name,picture,gender,locale&limit=20")
      @results = ::ActiveSupport::JSON.decode(response.body)["data"].map do |post|
        {type: 'facebook',
         name: post["name"],
         text: "#{post['gender']} #{post['locale']}",
         image_url: post["picture"]["data"]["url"]}
      end
    end
  end
end
