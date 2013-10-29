class Search
  class << self
    def with_twitter_tweets(keywords)
      Twitter.search(keywords, result_type: "recent").results.map do |status|
        {name: status.from_user, text: status.text, image_url: status.profile_image_url}
      end
    end

    def with_facebook_user(keywords)
      response = HTTParty.get("https://graph.facebook.com/search\?q\=#{keywords}\&type\=user\&access_token\=CAACaTYwTQ4IBADn6me2oOTcm47AgKm8ydwXOpzJAmWWf51OGhtJPDSH2pA5lc8x8WsHr1kllCWJ3AZAnTVETsvju6Ojcp2Wy4kf34rC42chZCE8hrnSn8Hnq1pJhvsi9CcoDikxJBxZCpA2K8dBFdoDGFEXzAtiAPYQMTZCDJnV5ZCfzZAjZB4MNZCtDX6OfVzrtxbmwXhJcnwZDZD&fields\=name,picture,gender,locale&limit=20")
      @results = ::ActiveSupport::JSON.decode(response.body)["data"].map do |post|
        {name: post["name"],
         text: "#{post['gender']} #{post['locale']}",
         image_url: post["picture"]["data"]["url"]}
      end
    end
  end
end
