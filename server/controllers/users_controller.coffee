class UsersController
  get: (req, res) ->
    collection = []
    collection.push first_name: 'Alexander', last_name: 'Zinchenko', age: 22
    collection.push first_name: 'Boris', last_name:'Abrabov', age: 32
    collection.push first_name: 'Zahar', last_name:'Kireev', age: 42
    collection.push first_name: 'Grigory', last_name: 'Ivanov', age: 52

    res.json collection

module.exports = UsersController