module ApplicationHelper
  def get_alert_class name
    case name
    when "error"
      class_name = "danger"
    when "success"
      class_name = "success"
    else
      class_name = "info"
    end
  end
end
