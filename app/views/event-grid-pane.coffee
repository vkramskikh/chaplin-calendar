BaseView = require '/views/base/view'
GridCalendarEventsView = require './grid-events'

module.exports = class CalendarEventGridPaneView extends BaseView
  id: 'grid'
  template: require './templates/event-grid'
  getTemplateData: ->
    intervals = _.map @collection.model::generateIntervals(), @collection.model::minutesToTime
    _.extend {}, super, {intervals: intervals}
  render: ->
    super
    @subview 'gridEvents', new GridCalendarEventsView {autoRender: true, @collection, container: @el}
