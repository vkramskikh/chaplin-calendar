BaseView = require '/views/base/view'
CalendarEventListPaneView = require './event-list-pane'
CalendarEventGridPaneView = require './event-grid-pane'

module.exports = class CalendarMainView extends BaseView
  template: require './templates/calendar'
  regions:
    eventListPane: '#event-list-pane'
    gridPane: '#grid-pane'
  render: ->
    super
    @subview 'eventListPane', new CalendarEventListPaneView {autoRender: true, @collection, region: 'eventListPane'}
    @subview 'gridPane', new CalendarEventGridPaneView {autoRender: true, @collection, region: 'gridPane'}

