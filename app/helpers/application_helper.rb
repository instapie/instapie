module ApplicationHelper
  def http_url(route)
    self.send(:"#{route}_url", url_options_for_protocol(:http))
  end

  def https_url(route)
    self.send(:"#{route}_url", url_options_for_protocol(:https))
  end

  def action_link(text, url, options={})
    link_to(text, url, options.merge(:class => 'action'))
  end

  def back_link(url, options={})
    link_to('Back', url, options.merge(:class => 'back'))
  end
end
