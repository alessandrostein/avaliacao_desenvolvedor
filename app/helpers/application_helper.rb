module ApplicationHelper

  def notification
    messages = ""
    [:success, :danger].each {|type|
      if flash[type]
        messages += "<div class='alert alert-#{type}' role='alert'>#{flash[type]}</div>"
      end
    }
    messages.html_safe
  end
end
