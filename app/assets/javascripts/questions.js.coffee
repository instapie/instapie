getPieData = (colors) ->
  answers = getArray(document.querySelectorAll('.answers .answer'))

  Lazy(answers)
    .map((answer) -> {
      answer: answer.textContent,
      votes: answer.querySelector('.vote-count').textContent
    })
    .reject((answer) -> answer.votes == '')
    .map((answer, i) -> {
      value: parseInt(answer.votes, 10),
      label: answer.answer,
      color: colors[i % colors.length]
    })
    .toArray()

addNewOptionRow = ->
  field = $(this).closest('.field')
  lastOptionRow = field.find('input[type="text"]:last-of-type')
  lastOptionRow.clone().val('').insertBefore(this)

init = ->
  # Wire up the 'Add another option' link
  $('.add-option').on('click', addNewOptionRow)

refresh = ->
  colors = getColorArray()

  # Highlight table rows
  answers = document.querySelectorAll('.answers .answer')
  if answers? and answers.length > 0
    Lazy(getArray(answers))
      .select((answer) -> answer.querySelector('.vote-count').textContent != '')
      .each (answer, i) ->
        answer.style.borderLeft = '5px solid ' + colors[i % colors.length]

  # Draw pie chart
  canvas = document.querySelector('.pie canvas')
  if canvas?
    context = canvas.getContext('2d')
    new Chart(context).Pie(getPieData(colors), { animation: false })

$(document).ready(combine(init, refresh))
$(document).on('page:change', refresh)
