class AccountController < ApplicationController
  
  def setup
    @invite = Invite.find_by_invite_code(params[:id])
    @user = User.find_by_email(@invite.email)
    if @invite.nil?
      flash[:warning] = "認証コードに誤りがあります"
    end
  end
  
  def regist
    invite = Invite.find_by_invite_code(params[:invite][:invite_code])
    if invite.nil?
      flash[:warning] = "認証コードに誤りがあります"
    else     
      user = User.find_by_email(invite.email)
      user = User.new if user.nil?
      user.twitter_id = params[:user][:twitter_id]
      user.email = invite.email
      user.regist_at = Time.now
    
      if user.save
        flash[:notice] = "認証が完了しました。がんがん「もばめるったー」と唱えてください。"
      else
        flash[:warning] = "登録に失敗しました。"
      end
    end
    redirect_to :controller => 'mobmaitter', :action => 'index'
  end
end
