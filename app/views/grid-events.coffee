BaseView = require '/views/base/view'

class GridCalendarEventView extends BaseView
  className: 'grid-event'
  template: require './templates/grid-event'
  bindings:
    '.event-name': 'name'
    '.event-time':
      observe: ['start', 'end']
      onGet: (time) ->
        minutesToTime = @model.constructor::minutesToTime
        minutesToTime(time[0]) + ' - ' + minutesToTime(time[1])
    ':el':
      observe: ['start', 'end']
      update: ($el, time) ->
        $el.css 'top', time[0] + 'px'
    '.grid-event-content':
      observe: ['start', 'end']
      update: ($el, time) ->
        $el.height time[1] - time[0] - 1
  events:
    dragstop: 'updateEventTime'
  updateEventTime: ->
    oldStartTime = @model.get('start')
    oldEndTime = @model.get('end')
    # sometimes result is +1/-1 pixel for some reason
    newStartTime = Math.round(@$el.position().top / 30) * 30
    console.log(oldEndTime, oldStartTime, newStartTime)
    newEndTime = newStartTime + oldEndTime - oldStartTime
    @model.set(start: newStartTime, end: newEndTime)
  render: ->
    super
    @$el.draggable({
      containment: '#grid'
      stack: '#grid .grid-event'
      snap: true
      axis: 'y'
      grid: [0, 30]
    })
    @stickit @model

module.exports = class GridCalendarEventsView extends Chaplin.CollectionView
  itemView: GridCalendarEventView
  id: 'grid-events'
