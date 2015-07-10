class @ModelQuery extends Mixin
  @buildFromResponse: (data, callback) ->
    data = data[@namespace()] || data[pluralize(@namespace())]

    if data.constructor == Array
      models = (new @(datum) for datum in data)
      callback models
    else if typeof data == "object"
      callback new @(data)
    else
      callback false

  @all: (callback = ->) ->
    $.getJSON @resource().index, (data) =>
      @buildFromResponse data, callback
    return @

  @find: (id, callback) ->
    $.getJSON @replaceURLParameters(@resource().show, id: id), (data) =>
      @buildFromResponse data, callback
    return @

  @where: (parameters, callback) ->
    $.getJSON @replaceURLParameters(@resource().index, parameters), (data) =>
      @buildFromResponse data, callback
    return @

  @resource: =>
    # index: "",
    # show: "",
    # create: "",
    # update: "",
    # destroy: ""

    throw "Override resource in model"

  @namespace: =>
    throw "Override namespace in model"
