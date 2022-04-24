module BlogHelper
  def stringfy_date(date)
    date.to_date.strftime("%b %d, %Y")
  end
end
