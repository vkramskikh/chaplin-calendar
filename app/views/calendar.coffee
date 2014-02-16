BaseView = require '/views/base/view'
CalendarEventListPaneView = require './event-list-pane'

module.exports = class CalendarMainView extends BaseView
  template: require './templates/calendar'
  regions:
    eventListPane: '#event-list-pane'
    gridPane: '#grid-pane'
  render: ->
    super
    calendarEventListPaneView = new CalendarEventListPaneView {
      autoRender: true,
      @collection, region: 'eventListPane'
    }
    @subview 'eventListPane', calendarEventListPaneView

