BaseView = require '/views/base/view'
GridCalendarEventsView = require './grid-events'

module.exports = class CalendarEventGridPaneView extends BaseView
  template: require './templates/event-grid'
  regions:
    gridEvents: '#grid-events'
  render: ->
    super
    @subview 'gridEvents', new GridCalendarEventsView {autoRender: true, @collection, region: 'gridEvents'}
