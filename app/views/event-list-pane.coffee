BaseView = require '/views/base/view'
ListCalendarEventsView = require './list-events'

module.exports = class CalendarEventListPaneView extends BaseView
  template: require './templates/event-list'
  regions:
    eventList: '#event-list'
  events:
    'click button[name=add-event]': 'addEvent'
  addEvent: ->
    newEvent = new @collection.model({
      name: ''
      start: 0
      end: @collection.model::interval
    })
    @collection.add(newEvent)
    newEvent.save()
  render: ->
    super
    @subview 'eventList', new ListCalendarEventsView {autoRender: true, @collection, region: 'eventList'}
