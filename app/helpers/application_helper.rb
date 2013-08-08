module ApplicationHelper
  def action_link(text, url, options={})
    link_to(text, url, options.merge(:class => 'action'))
  end

  def back_link(url, options={})
    link_to('Back', url, options.merge(:class => 'back'))
  end
end
