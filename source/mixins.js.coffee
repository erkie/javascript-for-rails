class @Mixin
  class EmptyReferenceClass

  @mixin: (superClass) ->
    mixinClass = @

    class NewClass extends superClass
      constructor: ->
        mixinClass.apply(@, arguments)
        super

    for attr, method of @ when @.hasOwnProperty(attr) && !EmptyReferenceClass.hasOwnProperty(attr)
      continue if attr in ["__super__"]
      NewClass[attr] = method

    for attr, method of @prototype when @prototype.hasOwnProperty(attr) && !EmptyReferenceClass.prototype.hasOwnProperty(attr)
      NewClass.prototype[attr] = method

    NewClass