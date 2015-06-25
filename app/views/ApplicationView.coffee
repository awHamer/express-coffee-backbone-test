define ['backbone', 'collections/UsersCollection', 'views/UsersTableView'], (backbone, UsersCollection, UsersTableView) ->
  class ApplicationView extends Backbone.View
    el: '#content'
    template: null

    initialize: ->
      users = new UsersCollection
      usersView = new UsersTableView collection: users

      users.fetch success: ->
        usersView.updateData()

      @template = usersView.render().$el
      @render()

    render: ()->
      $(@el).html @template
      @