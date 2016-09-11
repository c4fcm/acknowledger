require '../config/environment'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = nil
  config.consumer_secret = nil
  config.oauth_token = nil
  config.oauth_token_secret = nil
end

class_const = Kernel.const_get(ARGV[1])

twitter_accounts = File.new(ARGV[0], "r")
while (twitter_account = twitter_accounts.gets.chomp)
  print twitter_account + " "
  begin
    account = Twitter.user(twitter_account)
    if(account)
      person = class_const.find_by_twitter_account(twitter_account)
      if(person and (person.name.nil? or person.name=="") )
        person.name = account.name
        person.uri = "https://twitter.com/#{twitter_account}"
        person.avatar = account.profile_image_url_https
        person.twitter_data = account.to_json
        person.save!
        print " -\n"
      else
        person = class_const.create!({:name=>account.name, uri: "https://twitter.com/#{twitter_account}",
                                :avatar=>account.profile_image_url_https, :twitter_data=>account.to_json,
                                :twitter_account=>twitter_account})
        print " o\n"
      end
    end
  rescue Exception=>e
    puts e
    
  end
end
