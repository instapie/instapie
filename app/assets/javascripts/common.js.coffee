# ----- Shared functionality -----

window.getColorMap = ->
  stylesheetLink = document.querySelector('link[href*="common"]')
  stylesheetLink ?= document.querySelector('link[href*="application"')

  stylesheetRules = getArray(stylesheetLink.sheet.cssRules)
  colorPattern = /^#([^-]*)-color$/

  Lazy(stylesheetRules)
    .where({ type: 1 })
    .select((rule) -> rule.selectorText.match(colorPattern))
    .map((rule) -> [extract(rule.selectorText, colorPattern), rule.style.color])
    .toObject()

window.getColorArray = ->
  colorMap = getColorMap()
  Lazy(['primary', 'warning', 'info', 'success', 'danger'])
    .map((label) -> colorMap[label])
    .toArray()

window.getArray = (collection) ->
  Array::slice.call(collection, 0)

window.extract = (string, pattern) ->
  string.match(pattern)[1]

window.combine = ->
  functions = getArray(arguments)
  return ->
    Lazy(functions).each (fn) -> fn()

# ----- Global behavior -----

init = ->
  $(document).on 'click', '.reveal-link', ->
    target = $(this).data('target')
    $(target).show()

refresh = ->
  revealAlerts()

revealAlerts = ->
  $('#notice, #error').animate { bottom: 0 }, 1000, ->
    hideAlertsAfterDelay()

hideAlerts = ->
  $('#notice, #error').animate { bottom: '-50px' }, 1000

hideAlertsAfterDelay = ->
  setTimeout(hideAlerts, 3000)

$(document).ready(combine(init, refresh))
$(document).on('page:change', refresh)
