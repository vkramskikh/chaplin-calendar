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
        $el.height time[1] - time[0]
        $el.css 'top', time[0] + 'px'
  render: ->
    super
    @stickit @model

module.exports = class GridCalendarEventsView extends Chaplin.CollectionView
  itemView: GridCalendarEventView
  id: 'grid-events'
