BaseView = require '/views/base/view'

# Site view is a top-level view which is bound to body.
module.exports = class SiteView extends BaseView
  container: 'body'
  regions:
    main: '#main-container'
  template: require './templates/site'
