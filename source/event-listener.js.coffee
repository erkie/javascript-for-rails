class @EventListener extends Mixin  
  trigger: (eventName) =>
    @_classEvents ||= {}
    @_classEvents[eventName] ||= []

    for callback in @_classEvents[eventName]
      callback.apply(@, [].slice.call(arguments, 1))

  on: (eventName, callback) =>
    @_classEvents ||= {}
    @_classEvents[eventName] ||= []
    @_classEvents[eventName].push callback

  unlisten: (eventName, callback) =>
    @_classEvents ||= {}
    @_classEvents[eventName] = @_classEvents[eventName].filter((a) => a != callback)