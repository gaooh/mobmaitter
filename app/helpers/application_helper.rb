# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  
  def warning_message(message, value = nil)
    if message != nil && !message.empty?
      value = message if value == nil
      "<font color=red>#{value}</font>"
    else
      "#{value}" if value != nil
    end
  end
   
end
