ingredients = Ingredient.create([
  {name: 'banana'},
  {name: 'baking powder'},
  {name: 'coconut milk'},
  {name: 'flour'},
  {name: 'cinnamon'},
  {name: 'soy milk'},
  {name: 'black beans'},
  {name: 'cheddar cheese'},
  {name: 'corn'},
  {name: 'corn tortilla'},
  {name: 'flour tortilla'},
  {name: 'chicken'},
  {name: 'garlic'},
  {name: 'egg'},
  {name: 'potato'},
  {name: 'sweet potato'},
  {name: 'avocado'},
  {name: 'vanilla'}
])

users = User.create([
  { username: 'Ellen',
    admin: true,
    email: 'ellen@ellen.com',
    password: 'password'
  },
  { username: 'Walker',
    email: 'walker@walker.com',
    password: 'password'
  },
  { username: 'Helo',
    email: 'helo@helo.com',
    password: 'password'
  },
  { username: 'Apollo',
    email: 'apollo@apollo.com',
    password: 'password'
  },
  { username: 'Athena',
    email: 'athena@athena.com',
    password: 'password'
  }
  { username: 'Starbuck',
    email: 'starbuck@starbuck.com',
    password: 'password'
  }
])

recipes = Recipe.create([
  { name: 'Vegan Banana Pancakes', 
    description: 'Yummy, vegan pancakes superior in almost every way to the regular kind.',
    ingredients: [
      Ingredient.find_by(name: 'banana'), 
      Ingredient.find_by(name: 'flour'), 
      Ingredient.find_by(name: 'coconut milk'), 
      Ingredient.find_by(name: 'vanilla'),
      Ingredient.find_by(name: 'cinnamon'),
      Ingredient.find_by(name: 'baking powder')
    ],
    user_id: 1
  },
  { name: 'Baked Sweet Potatoes with Avocado and Chicken',
    description: 'A tasty alternative to twice-baked potatoes, slightly sweet and full of yummy good stuff',
    ingredients: [
      Ingredient.find_by(name: 'sweet potato'),
      Ingredient.find_by(name: 'chicken'),
      Ingredient.find_by(name: 'avocado')
    ],
    user_id: 1
  },

  { name: 'TACOS!',
    description: 'Yummy yummy tacos. Ellen cries herself to sleep at night because she can\'t have any.',
    ingredients: [
      Ingredient.find_by(name: 'chicken'),
      Ingredient.find_by(name: 'avocado'),
      Ingredient.find_by(name: 'flour tortilla'),
      Ingredient.find_by(name: 'black beans'),
      Ingredient.find_by(name: 'cheddar cheese'),
      Ingredient.find_by(name: 'corn')
    ],
    user_id: 3
  }
])