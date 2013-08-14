hideAlerts = ->
  $('#notice, #error').slideUp ->
    $(this).remove()

hideAlertsAfterDelay = ->
  setTimeout(hideAlerts, 3000)

$(document).ready(hideAlertsAfterDelay)
$(document).on('page:change', hideAlertsAfterDelay)
