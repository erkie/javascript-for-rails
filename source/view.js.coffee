class @View
  events: {}

  constructor: (@options = {}) ->
    @element = $(@options.el || @template || document.body)

    # bind events
    for eventString, method of @events
      @addEventFromString eventString, @[method]

    @initialize.apply(@, arguments)

  $: =>
    @element.find.apply(@element, arguments)

  initialize: =>

  destroy: =>
    @element.remove()
    
    # remove events
    @element.off('.controller')

  addEventFromString: (eventString, method) =>
    throw new Error("method for #{eventString} not found") unless method

    selector = eventString.split(" ")

    eventName = selector.shift() + '.controller'
    selector = selector.join(" ")

    @element.on eventName, selector, method

@View = EventListener.mixin @View