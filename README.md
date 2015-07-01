# mvc.coffee

A simple Model View Controller framework that works beautifully together with Ruby on Rails.

## Installation

### Rails

```ruby
gem 'mvc-coffee'
```

And in your `application.js`

```js
//= require mvc-coffee
```

### Bower

*TODO: Implement bower*

## Documentation

### Controllers

```coffeescript
class @CheckoutController extends Controller
  events:
    "click .pay": "payClicked"

  initialize: =>
    @shoppingCart = new ShoppingCart()

  payClicked: (e) =>
    e.preventDefault()

    @shoppingCart.save =>
      @gotoPayment()
```

### Models

```coffeescript
class @ShoppingCart extends Model
  @schema: ->
    id: new Attribute.Id()
    products: new Attribute.Array(model: Product)

  @namespace: => "shopping_cart"

  @resource: ->
    index: "/shopping_carts",
    show: "/shopping_carts/:id",
    create: "/shopping_carts",
    update: "/shopping_carts/:id",
    destroy: "/shopping_carts/:id"

  empty: =>
    @products = []
```

### Views

```coffeescript
class View.Basket extends View
  events:
    "click .empty": "emptyButtonClicked"

  initialize: =>
    super
    @shoppingCart = @options.shoppingCart

  emptyButtonClicked: (e) =>
    e.preventDefault()

    @shoppingCart.empty()
```

#### Hooks

Hooks are a way for a view class to hook onto page initialization. So instead of each object having to add an `onload` event and trigger automatic construction it can be done in hooks instead.

For example, to create a basket on each page load:

```coffeescript
class View.Basket extends View
  # basket code...

# hooks will be run in the context of the page object
Page.Hooks.Basket = ->
  @basket = new View.Basket el: $(".basket"), shoppingCart: new ShoppingCart()
```

### The `Page` class

The `Page` is the global class representing the entire page. Here you should put page global objects.

## Conventions

1. Match your controller classes exactly with your rails controllers
2. Models and Controllers go on the global object


