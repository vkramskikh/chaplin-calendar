CalendarEvent = require './event'

module.exports = class CalendarEvents extends Chaplin.Collection
  localStorage: new Backbone.LocalStorage 'calendar'
  model: CalendarEvent