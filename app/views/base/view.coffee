Handlebars.registerHelper 'log', (context) ->
  console.log context

module.exports = class BaseView extends Chaplin.View
  # Precompiled templates function initializer.
  getTemplateFunction: ->
    @template
