class CheapskateClient
  include Cheapskate::Client

  def alert_error(controller, message)
    controller.flash[:error] = message
  end
end
