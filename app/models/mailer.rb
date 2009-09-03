class Mailer < Iso2022jpMailer
    
  def invite(invite, sent_at = Time.new)
    @subject    = "#{base64('もばめるったー認証')}"
    @recipients = invite.email
    @from       = "#{base64('もばめるったー認証係')}<invite-mobmaitter@gaooh.com>"
    @sent_on    = sent_at
    @headers    = {}

    body :invite => invite
  end
  
  def mobmaitter(user, text, sent_at = Time.new)
    @subject    = "#{base64('もばめるったーさんよりお便り')}"
    @recipients = user.email
    @from       = "#{base64('もばめるったー')}<mobmaitter@gaooh.com>"
    @sent_on    = sent_at
    @headers    = {}

    body :user => user, :text => text
  end
  
end
