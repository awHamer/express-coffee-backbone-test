define ['backbone', 'jquery'], (Backbone, $) ->
  class UsersRowView extends Backbone.View
    tagName: 'tr'
    template: null

    initialize: ->
      @template = _.template $('#users-row').html()

    render: ->
      @$el.html @template @model.toJSON()
      @