require 'logger'

module Twitter 
  USER = "mobmaitter"
  PASSWORD = "sabosabo"
  SITE = "http://#{Twitter::USER}:#{Twitter::PASSWORD}@twitter.com/"
end

class Twitter::Status < ActiveResource::Base
  SITE = "#{Twitter::SITE}statuses"
  self.site = Twitter::SITE
  self.logger = Logger.new($stderr)
end

class Twitter::Status::Friend < ActiveResource::Base
  self.site = Twitter::Status::SITE
  self.logger = Logger.new($stderr)
end

class Twitter::Status::Follower < ActiveResource::Base  
  self.site = Twitter::Status::SITE
  self.logger = Logger.new($stderr)
end

class Twitter::User < ActiveResource::Base  
  self.site = Twitter::SITE
end

class Twitter::DirectMessage < ActiveResource::Base  
  self.site = Twitter::SITE
end