module FormatHelper
  def short_date_format(date)
    date.strftime('%B %d, %Y')
  end
end
