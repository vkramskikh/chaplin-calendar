CalendarEvent = require 'models/event'
CalendarEvents = require 'models/events'

SiteView = require 'views/site'
CalendarMainView = require 'views/calendar'

calendar = [
  {start: '01:00', end: '02:30', name: 'Event 1'}
  {start: '04:00', end: '05:00', name: 'Event 2'}
]

module.exports = class CalendarController extends Chaplin.Controller
  beforeAction: ->
    @compose 'site', SiteView

  index: (params) ->
    @collection = new CalendarEvents calendar
    console.log @collection
    @view = new CalendarMainView {
      autoRender: true,
      @collection, region: 'main'
    }
