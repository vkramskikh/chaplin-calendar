BaseView = require '/views/base/view'

class ListCalendarEventView extends BaseView
  className: 'form-group'
  template: require './templates/list-event'
  listen:
    'change model': -> @model.save()
    'change:start model': 'actualizeEndTime'
    'change:end model': 'actualizeEndTime'
  events:
    'click button[name=remove-event]': 'removeEvent'
  removeEvent: ->
    @model.destroy()
  actualizeEndTime: ->
    if @model.get('end') <= @model.get('start')
      @model.set(end: @model.get('start') + @model.constructor::interval)
  initialize: ->
    selectOptions = _.map @model.constructor::generateIntervals(), ((minutes) -> {value: minutes, label: @model.constructor::minutesToTime minutes}), this
    @bindings =
      '[name=start]':
        observe: 'start'
        selectOptions: collection: selectOptions.slice(0, -1)
      '[name=end]':
        observe: 'end'
        selectOptions: collection: selectOptions
      '[name=name]': 'name'
  render: ->
    super
    @stickit @model

module.exports = class ListCalendarEventsView extends Chaplin.CollectionView
  itemView: ListCalendarEventView
