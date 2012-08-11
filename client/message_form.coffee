Template.message_form.creatingEvent = ->
    creatingEvent = Session.get 'creatingEvent'
    creatingEvent or= no
    return creatingEvent

closeCreatingEvent = ->
    Session.set 'creatingEvent', no

Template.message_create.events =
    'click .close': closeCreatingEvent
    'reset form': closeCreatingEvent
    'focus #orgform-desc': (e) ->
        $this = $(e.target)
        $this.autosize()
Template.message_start.events =
    'click #organize-message': -> Session.set 'creatingEvent', yes
