BaseView = require '/views/base/view'
CalendarEventListView = require './event-list'

module.exports = class CalendarMainView extends BaseView
  regions:
    eventList: '#event-list'
    grid: '#grid'
  template: require './templates/calendar'
  render: ->
    super
    calendarEventListView = new CalendarEventListView {
      autoRender: true,
      @collection, region: 'eventList'
    }
    @subview 'eventList', calendarEventListView

