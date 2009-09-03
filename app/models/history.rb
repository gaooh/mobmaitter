class History < ActiveRecord::Base
  #　メッセージタイプ 1:もばるめったー発言
  MESSAGE_TYPE_FRIEND = 1 
  #　メッセージタイプ 2:ダイレクトメッセージ
  MESSAGE_TYPE_DIRECT = 2
  
  def from_friend
    self.message_type = MESSAGE_TYPE_FRIEND
    self.send_at = Time.now
    return self
  end
  
  def from_direct_message
    self.message_type = MESSAGE_TYPE_DIRECT
    self.send_at = Time.now
    return self
  end
  
  #　友達の発言を取得
  def self.find_friend_message(message_id)
    find(:all, :conditions=>[" message_type = ? and message_id = ? ", MESSAGE_TYPE_FRIEND, message_id])
  end
  
  # ダイレクトメッセージ一覧を取得
  def self.find_direct_message(message_id)
    find(:all, :conditions=>[" message_type = ? and message_id = ? ", MESSAGE_TYPE_DIRECT, message_id])
  end
end
