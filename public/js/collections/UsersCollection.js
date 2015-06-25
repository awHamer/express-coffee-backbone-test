// Generated by CoffeeScript 1.9.3
var extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

define(['backbone', 'models/UserModel'], function(Backbone, User) {
  var UsersCollection;
  return UsersCollection = (function(superClass) {
    extend(UsersCollection, superClass);

    function UsersCollection() {
      return UsersCollection.__super__.constructor.apply(this, arguments);
    }

    UsersCollection.prototype.model = User;

    UsersCollection.prototype.url = '/users';

    UsersCollection.prototype.sortAttribute = 'first_name';

    UsersCollection.prototype.sortDirection = 1;

    UsersCollection.prototype.sortUsers = function(attribute) {
      this.sortAttribute = attribute;
      this.sort();
    };

    UsersCollection.prototype.comparator = function(a, b) {
      a = a.get(this.sortAttribute);
      b = b.get(this.sortAttribute);
      if (a === b) {
        return 0;
      }
      if (this.sortDirection === 1) {
        if (a > b) {
          return 1;
        } else {
          return -1;
        }
      } else {
        if (a < b) {
          return 1;
        } else {
          return -1;
        }
      }
    };

    return UsersCollection;

  })(Backbone.Collection);
});
