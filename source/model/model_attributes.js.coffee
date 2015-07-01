class @ModelAttributes extends Mixin
  @schema: =>
    {}
    
  setAttributes: (attributes) =>
    for key, attribute of attributes when attributes.hasOwnProperty(key)
      @set key, attribute

  set: (key, value) =>
    key = @transformAttributeName(key)
    attr = @constructor.schema()[key]
    if attr && typeof value != "undefined"
      @[key] = attr.transform(value)
      @trigger "change", key, value
    #else
    #  throw "Could not set #{key}, not in schema"

  transformAttributeName: (attribute) =>
    attribute.replace /[-_ ]\D/g, (match) =>
      match.charAt(1).toUpperCase()

  untransformAttributeName: (attribute) =>
    attribute.replace /\w[A-Z]/g, (match) =>
      if match
        "#{match.charAt(0)}_#{match.charAt(1).toLowerCase()}"
      else
        ""