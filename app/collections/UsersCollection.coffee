define ['backbone', 'models/UserModel'], (Backbone, User) ->
  class UsersCollection extends Backbone.Collection
    model: User
    url: '/users'
    sortAttribute: 'first_name'
    sortDirection: 1

    sortUsers: (attribute) ->
      @sortAttribute = attribute
      @sort()
      return

    comparator: (a, b) ->
      a = a.get(@sortAttribute)
      b = b.get(@sortAttribute)

      if a == b
        return 0

      if @sortDirection == 1
        if a > b then 1 else -1
      else
        if a < b then 1 else -1