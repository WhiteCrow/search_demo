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
      response = HTTParty.get("https://graph.facebook.com/search\?q\=#{keywords}\&type\=user\&access_token\=CAACaTYwTQ4IBAMLlg5vfZAMYw2W07Jcd7NdW4taiXmO1KLPQCZBTz54AO9IbXODyslPxBMKpH8TCqMNQImMYLIbDAG0ORrfB3Q3wnGovuLLZB91E9aLDG3YCCxQLI6aXK3mz4reL9ApmfZACvZAEklYL9Byb0DZAjisSRJWJ8aDmInOQBhWSmR7RINreS71GaRKTJi5CvLQQZDZD&fields\=name,picture,gender,locale&limit=20")
      @results = ::ActiveSupport::JSON.decode(response.body)["data"].map do |post|
        {type: 'facebook',
         name: post["name"],
         text: "#{post['gender']} #{post['locale']}",
         image_url: post["picture"]["data"]["url"]}
      end
    end
  end
end
