class Router
  constructor: (app)->
    app.get '/', (req, res, next) =>
      @callControllerMethod 'application', 'index', req, res, next

    app.get '/:controller', (req, res, next) =>
      @callControllerMethod req.params.controller, 'get', req, res, next

  callControllerMethod: (controller, method, req, res, next) ->
    try
      controllerClass = require "./controllers/#{controller}_controller.coffee"
    catch e
      console.warn "controller #{controller} not found", e
      next()
      return

    controller = new controllerClass
    if method of controller and typeof controller[method] is 'function'
      controller[method] req, res, next

module.exports = Router
