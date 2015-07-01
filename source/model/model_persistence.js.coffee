class @ModelPersistence extends Mixin
  save: (callback = ->) =>
    if @isPersisted()
      @update(callback)
    else
      @create(callback)

  create: (callback = ->) =>
    namespace = @.constructor.namespace()

    data = {}
    data[namespace] = @toJSON()

    xhr = $.ajax
      url: @replaceURLParameters(@.constructor.resource().create),
      method: "POST",
      data: data,
      dataType: "json"
    .done (response) =>
      @setAttributes response[namespace] if response[namespace]
      callback(true)
    .fail =>
      callback(false)

    return @

  update: (callback = ->) =>
    namespace = @.constructor.namespace()

    data = {}
    data[namespace] = @toJSON()

    xhr = $.ajax
      url: @replaceURLParameters(@.constructor.resource().update),
      method: "PUT",
      data: data,
      dataType: "json"
    .done (response) =>
      @setAttributes response[namespace] if response[namespace]
      callback(true)
    .fail =>
      callback(false)

    return @

  destroy: (callback = ->) =>
    namespace = @.constructor.namespace()

    data = {}
    data[namespace] = @toJSON()

    xhr = $.ajax
      url: @replaceURLParameters(@.constructor.resource().destroy),
      method: "DELETE",
      data: data,
      dataType: "json"
    .done (response) =>
      @setAttributes response[namespace] if response[namespace]
      callback(true)
    .fail =>
      callback(false)

    return @

  isPersisted: =>
    @id?

  toJSON: =>
    result = {}
    for key, attribute of @.constructor.schema()
      result[@untransformAttributeName(key)] = @[key]
    result

  replaceURLParameters: (url) =>
    url.replace /:([A-Za-z0-9_]+)/g, (_, match) =>
      @[match]
