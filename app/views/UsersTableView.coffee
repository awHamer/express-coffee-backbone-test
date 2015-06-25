define ['backbone', 'jquery', 'views/UsersRowView'], (Backbone, $, UsersRow) ->
  class UsersTableView extends Backbone.View
    _data: []
    tagName: 'table'
    className: 'table users-table'
    template: null
    iconUp: 'glyphicon-arrow-up'
    iconDown: 'glyphicon-arrow-down'
    events:
      'click th': 'sortElements'

    initialize: ->
      @template = _.template $('#users-table').html()
      @listenTo @collection, 'sort', @updateData

      @updateData()

    updateData: ->
      $table = @$('tbody')

      _.invoke @_data, 'remove' #clear

      @_data = @collection.map (model) =>
        row = new UsersRow model: @collection.get model
        $table.append row.render().$el
        row

    render: ->
      @$el.html @template()
      @$('th div').append $('<span>', class: 'glyphicon')
      @$('th[column="' + @collection.sortAttribute + '"] span').addClass @iconUp
      @updateData()
      @

    sortElements: (event) ->
      $el = $(event.currentTarget)
      ns = $el.attr 'column'
      cs = @collection.sortAttribute
      if ns == cs
        @collection.sortDirection *= -1
      else
        @collection.sortDirection = 1
      $el.closest('thead').find('span').attr 'class', 'glyphicon'
      if @collection.sortDirection == 1
        $el.find('span').addClass @iconUp
      else
        $el.find('span').addClass @iconDown
      @collection.sortUsers ns
      return
