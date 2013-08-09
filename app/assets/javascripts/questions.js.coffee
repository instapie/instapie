init = ->
  canvas = document.querySelector('.pie canvas')

  context = canvas.getContext('2d')

  data = [
    {
      value: 30,
      color:"#F38630"
    },
    {
      value : 50,
      color : "#E0E4CC"
    },
    {
      value : 100,
      color : "#69D2E7"
    }     
  ]

  new Chart(context).Pie(data)

$(document).ready(init)
$(document).on('page:change', init)
