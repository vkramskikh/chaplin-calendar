BaseView = require '/views/base/view'

class GridCalendarEventView extends BaseView
  template: require './templates/grid-event'
  render: ->
    super
    @stickit @model

module.exports = class GridCalendarEventsView extends Chaplin.CollectionView
  itemView: GridCalendarEventView
