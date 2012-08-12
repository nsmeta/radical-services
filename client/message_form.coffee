Meteor.startup ->
    $document = $(document)
    $document.tooltip
        selector: '[rel=tooltip]'

Template.message_form.creatingEvent = ->
    creatingEvent = Session.get 'creatingEvent'
    creatingEvent or= no
    return creatingEvent

closeCreatingEvent = ->
    Session.set 'creatingEvent', no

Template.message_create.init_template = ->
    Meteor.defer ->
        $('#orgform-desc').autosize()
        $('#orgform-groups').chosen()
Template.message_create.events =
    'click .close': closeCreatingEvent
    'reset form': closeCreatingEvent
Template.message_start.events =
    'click #organize-message': -> Session.set 'creatingEvent', yes
