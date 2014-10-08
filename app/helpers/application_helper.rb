module ApplicationHelper

  def fix_url(str)
    str.start_with?('http://') ? str : "http://#{str}"
  end

  def fix_datetime(str)
    str.strftime("%b %d %Y %I:%M:%S %p")
  end

end
