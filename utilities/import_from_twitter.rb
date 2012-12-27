require '../config/environment'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = "5vxGOYhVmFFgzZi17gqA"
  config.consumer_secret = "9lcMhgc6jtLfp8evCdlYv1naAs7DtvzPe7kQj9Cx71Y"
  config.oauth_token = "52332354-kExXTF423o9yzw1iZp2K0GNjnZo3fS6ZdNNb36g"
  config.oauth_token_secret ="xHBITaIsL0YckqfSCPQEfBVWuiuUTm4U2cszzOcJEQ"
end

twitter_accounts = File.new(ARGV[0], "r")
while (twitter_account = twitter_accounts.gets.chomp)
  print twitter_account + " "
  begin
    account = Twitter.user(twitter_account)
    if(account)
      person = Person.find_by_twitter_account(twitter_account)
      if(person and (person.name.nil? or person.name=="") )
        person.name = account.name
        person.uri = "https://twitter.com/#{twitter_account}"
        person.avatar = account.profile_image_url_https
        person.twitter_data = account.to_json
        person.save!
        print " -\n"
      else
        person = Person.create!({:name=>account.name, uri: "https://twitter.com/#{twitter_account}",
                                :avatar=>account.profile_image_url_https, :twitter_data=>account.to_json,
                                :twitter_account=>twitter_account})
        print " o\n"
      end
    end
  rescue Exception=>e
    puts e
    
  end
end
