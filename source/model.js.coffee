class @Model
  constructor: (attributes) ->
    @errors = {}
    @setAttributes attributes

@Model = ModelAttributes.mixin @Model
@Model = ModelQuery.mixin @Model
@Model = ModelPersistence.mixin @Model
@Model = EventListener.mixin @Model

window.Models = {}