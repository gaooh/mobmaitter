require File.dirname(__FILE__) + '/../config/environment'
require 'application'

ApplicationController.logger.info "DirectMessage start:#{Time.now}"

messages = Twitter::DirectMessage.find(:all)

for message in messages
  history = History.find_direct_message(message.id)
  next unless history.empty?
      
  user = User.find_by_twitter_id(message.sender_screen_name)
  next if user.nil?
      
  history = History.new.from_direct_message
  history.user_id = user.id
  history.message_id = message.id
  
  times = message.text.scan(/\d+[h|d|m]/)
  if times.empty?
    if history.save 
      Mailer.deliver_mobmaitter(user, message.text)
    else
      ApplicationController.logger.info "error:#{user}, #{message}"
    end
  else # 時間指定送信
    deriver = Time.now
    timeset = times[0].split(/(h|d|m)/) # [時間, 設定値]の配列がかえる
    case timeset[1]
    when 'm'
      deriver = deriver + timeset[0].to_i * 60
    when 'h'
      deriver = deriver + timeset[0].to_i * 60 * 60
    when 'd'
      deriver = deriver + timeset[0].to_i * 60 * 60 * 24
    end
    history.deriver_at = deriver
    history.message = message.text.sub(/\d+[h|d|m]/, "") # 指定部分は削除
    unless history.save 
      ApplicationController.logger.info "error:#{user}, #{message}"
    end
  end
  
end

ApplicationController.logger.info "DirectMessage end:#{Time.now}"
