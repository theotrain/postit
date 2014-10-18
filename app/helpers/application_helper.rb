module ApplicationHelper

  def fix_url(str)
    str.start_with?('http://') ? str : "http://#{str}"
  end

  def fix_datetime(dt)
    if logged_in? and !current_user.time_zone.blank?
      dt = dt.in_time_zone(current_user.time_zone)
    end
    dt.strftime("%b %d %Y %I:%M:%S %p %Z")
  end

end
