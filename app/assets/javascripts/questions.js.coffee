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

init = ->
  colors = getColorArray()

  # Highlight table rows
  answers = getArray(document.querySelectorAll('.answers .answer'))
  Lazy(answers)
    .select((answer) -> answer.querySelector('.vote-count').textContent != '')
    .each (answer, i) ->
      answer.style.borderLeft = '5px solid ' + colors[i % colors.length]

  # Draw pie chart
  canvas = document.querySelector('.pie canvas')
  context = canvas.getContext('2d')
  new Chart(context).Pie(getPieData(colors), { animation: false })

$(document).ready(init)
$(document).on('page:change', init)
