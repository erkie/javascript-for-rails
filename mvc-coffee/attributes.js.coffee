class @Attribute
  transform: (value) =>
    value

class Attribute.String extends Attribute
  transform: (value) =>
    value.toString()

class Attribute.Boolean extends Attribute
  transform: (value) =>
    !! value

class Attribute.Id extends Attribute
  transform: (value) =>
    value?.toString()

class Attribute.Integer extends Attribute
  transform: (value) =>
    value = parseInt(value, 10)
    if isNaN(value)
      0
    else
      value

class Attribute.Float extends Attribute
  transform: (value) =>
    value = parseFloat(value)
    if isNaN(value)
      0
    else
      value

class Attribute.Array extends Attribute
  constructor: ({@model}) ->
    super

  transform: (values) =>
    ret = []
    for value in values
      ret.push(new @model(value))
    ret

class Attribute.Model extends Attribute
  constructor: ({@model}) ->
    super

  transform: (values) =>
    if values.constructor == @model
      values
    else
      new @model(values)
