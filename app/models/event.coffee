module.exports = class CalendarEvent extends Chaplin.Model
  interval: 30
  minutesToTime: (minutes) ->
    pad = (num) -> if num < 10 then '0' + num else num
    pad(Math.floor(minutes / 60)) + ':' + pad(minutes % 60)
  generateIntervals: ->
    time = 0
    intervals = []
    while time < 24 * 60
      intervals.push time
      time += @interval
    intervals