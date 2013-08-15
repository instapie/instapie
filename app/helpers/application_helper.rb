module ApplicationHelper
  def meta_viewport_tag
    '<meta name="viewport" content="width=device-width, initial-scale=1.0" />'.html_safe
  end

  def http_url(route)
    self.send(:"#{route}_url", url_options_for_protocol(:http))
  end

  def https_url(route)
    self.send(:"#{route}_url", url_options_for_protocol(:https))
  end

  def action_link(text, url, options={})
    link_to(text, url, options.merge(:class => 'action'))
  end

  def js_link(text, options={})
    link_to(text, 'javascript:void(0);', options)
  end

  def back_link(url, options={})
    link_to('Back', url, options.merge(:class => 'back'))
  end

  def reveal_link(text, target, options={})
    js_link(text, options.merge(:class => 'reveal-link', :'data-target' => target))
  end

  def hidden_if(condition)
    condition ? { :style => 'display: none;' } : {}
  end

  def blank_if_zero(value)
    value == 0 ? '' : value
  end
end
