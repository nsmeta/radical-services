if Meteor.is_client
    Handlebars.registerHelper 'currentPage', ->
        currentPage = Session.get 'currentPage'
        currentPage ?= 'organize'
        return currentPage.replace /[^a-z]/i, ''
