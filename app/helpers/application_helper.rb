require 'digest/md5'
require 'uri'

module ApplicationHelper
  def meta_viewport_tag
    '<meta name="viewport" content="width=device-width, initial-scale=1.0" />'.html_safe
  end

  def http_url(route)
    self.send(:"#{route}_url", URL_OPTIONS[:http])
  end

  def https_url(route)
    self.send(:"#{route}_url", URL_OPTIONS[:https])
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

  def hash_to_query_string(hash)
    key_value_pairs = hash.map do |key, value|
      URI.escape("#{key}=#{value}")
    end

    '?' + key_value_pairs.join('&')
  end

  # Taken from (as always):
  # https://en.gravatar.com/site/implement/images/ruby/
  def user_image(user, options={})
    # get the email from URL-parameters or what have you and make lowercase
    email_address = user.email.downcase
     
    # create the md5 hash
    hash = Digest::MD5.hexdigest(email_address)

    query_string = hash_to_query_string(options.reverse_merge({
      :size    => 100,
      :default => 'identicon'
    }))

    # compile URL which can be used in <img src="RIGHT_HERE"...
    "http://www.gravatar.com/avatar/#{hash}#{query_string}"
  end

  def user_image_tag(user)
    image_tag(user_image(user), :class => 'user-image')
  end

  def small_user_image_tag(user)
    image_tag(user_image(user, :size => 50), :class => 'user-image-small')
  end
end
