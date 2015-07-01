class @Page
  Hooks: {}

  fire: (name) =>
    if controller = window["#{name}Controller"]
      @controller = new controller el: document.body

    @fireHooks()

  fireHooks: =>
    for name, hook of @Hooks
      hook.call @

@Page = new Page()

$ ->
  Page.fire $(document.body).data("controller")
