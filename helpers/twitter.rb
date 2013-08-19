module TwitterHelper
  
  def self.getClient
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = "dMjARKtUKC7pNRbzPoPQQ"
      config.consumer_secret = "2pAiZdhWF385RCw2FOFjRg957VUTJLLg8YGlZvNnM"
      config.access_token = "1479857516-hJIqjVK2wHZHVoXyLNmVPhIZTvmsiLXW4XAsEn3"
      config.access_token_secret = "rjbVwmvZlkEXhHLwLUMTmtYnZUAqljyvVvS4273CAs"
    end
    client
  end
end
