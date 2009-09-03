class MobmaitterController < ApplicationController

  def index
    @err_messages = Hash.new
  end
  
  def invite_send
    @err_messages = Hash.new
    invite = Invite.new(params[:invite])
    if invite.valid?
      user = User.find_by_email(invite.email)
      invite.create_at = Time.now
      invite.invite_code = Util.random_string(32)
      if invite.save
        flash[:notice] = "認証メールをおくりました。確認してください。"
        Mailer.deliver_invite(invite)
      else
        flash[:warning] = "登録処理に問題が発生しました。"
      end
    else
      invite.errors.each { |error| @err_messages["#{error[0]}"] = "#{error[1]}" }
      flash[:warning] = "入力内容に問題があります。"
    end
    
    render :action => 'index'
  end
  
  def find
    #@statuses = Twitter::Status.find(:all, :from => :user_timeline)
    @statuses = Twitter::Status.find(:all, :from => "/status/user_timeline/iszk.xml")
    #@statuses = Twitter::User.find("show/iszk")
    #@twitters = t.find("show/76276242")
  end
  
  def friend
    @friends = Twitter::Status::Friend.find(:all)
  end
  
end
