require File.dirname(__FILE__) + '/../config/environment'
require 'application'

ApplicationController.logger.info "start:#{Time.now}"

friends = Twitter::Status::Follower.find(:all)

for friend in friends
  statuses = Twitter::Status.find(:all, :from => "/status/user_timeline/#{friend.id}.xml")
  statuses.each {|status|
    if status.text =~ /.*もばめるったー.*/
      history = History.find_friend_message(status.id)
      next unless history.nil?
      
      user = User.find_by_twitter_id(friend.screen_name)
      next if user.nil?
      
      history = History.new.from_friend
      history.user_id = user.id
      history.message_id = status.id
      if history.save 
        Mailer.deliver_mobmaitter(user, status.text.gsub("もばめるったー", ""))
      else
        ApplicationController.logger.info "error:#{user}, #{status}"
      end
    end
  }
end

ApplicationController.logger.info "end:#{Time.now}"