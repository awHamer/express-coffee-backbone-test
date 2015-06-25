class UsersController
  get: (req, res) ->
    collection = [
      {first_name: 'Alexander', last_name: 'Zinchenko', age: 22}
      {first_name: 'Boris', last_name:'Abrabov', age: 32}
      {first_name: 'Zahar', last_name:'Kireev', age: 42}
      {first_name: 'Grigory', last_name: 'Ivanov', age: 52}
    ]

    res.json collection

module.exports = UsersController