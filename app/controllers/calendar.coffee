CalendarEvent = require 'models/event'
CalendarEvents = require 'models/events'

SiteView = require 'views/site'
CalendarMainView = require 'views/calendar'

module.exports = class CalendarController extends Chaplin.Controller
  beforeAction: ->
    @compose 'site', SiteView

  index: (params) ->
    @collection = new CalendarEvents
    @collection.fetch()
    @view = new CalendarMainView {autoRender: true, @collection, region: 'main'}
