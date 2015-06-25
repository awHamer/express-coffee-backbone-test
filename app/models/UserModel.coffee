define ['backbone'], (Backbone) ->
  class UserModel extends Backbone.Model
    defaults:
      first_name: ''
      last_name: ''
      age: 0