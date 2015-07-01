class @Page
  Hooks: {}

  fire: (name) =>
    if controller = window["#{name}Controller"]
      @controller = new controller el: document.body

@Page = new Page()

$ ->
  Page.fire $(document.body).data("controller")
