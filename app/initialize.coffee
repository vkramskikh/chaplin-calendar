routes = require './routes'

# Execute handler on document ready event.
$ ->
  new Chaplin.Application
    controllerSuffix: '', pushState: false, routes: routes
