CalendarEvent = require 'models/event'
CalendarEvents = require 'models/events'

SiteView = require 'views/site'
CalendarMainView = require 'views/calendar'
CalendarEventListView = require 'views/event-list'

module.exports = class CalendarController extends Chaplin.Controller
  beforeAction: ->
    @compose 'site', SiteView

  index: (params) ->
    @collection = new CalendarEvents []
    @view = new CalendarMainView {
      autoRender: true,
      @collection, region: 'main'
    }
