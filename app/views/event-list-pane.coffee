BaseView = require '/views/base/view'
ListCalendarEventsView = require './list-events'

module.exports = class CalendarEventListPaneView extends BaseView
  template: require './templates/event-list'
  regions:
    eventList: '#event-list'
  events:
    'click button[name=add-event]': 'addEvent'
  addEvent: ->
    @collection.add(new @collection.model)
    console.log(@collection)
  render: ->
    super
    calendarEventListView = new ListCalendarEventsView {
      autoRender: true,
      @collection, region: 'eventList'
    }
    @subview 'eventList', calendarEventListView
