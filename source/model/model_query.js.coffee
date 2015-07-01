class @ModelQuery extends Mixin
  @all: (callback = ->) ->
    $.getJSON @resource().index, (data) =>
      data = data[@namespace()]

      if data.constructor == Array
        models = (new @(datum) for datum in data)
        callback models
      else
        callback(false)

    return @

  @find: (id, callback) ->

  @resource: =>
    # index: "",
    # show: "",
    # create: "",
    # update: "",
    # destroy: ""

    throw "Override resource in model"

  @namespace: =>
    throw "Override namespace in model"