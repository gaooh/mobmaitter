class Invite < ActiveRecord::Base
  validates_format_of :email, :with => /^[\w\W]+@[\w\W]+$/, :message => "Emailの形式として正しくありません。"
end
